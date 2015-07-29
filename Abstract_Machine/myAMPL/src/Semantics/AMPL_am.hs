
module Semantics.AMPL_am where

import Syntax.TypesAMPL
import System.Process 
import Semantics.Terminal

----------------------------------------------------------------------
----------------------------------------------------------------------
--
--        Abstract machine for Message Passing Language (AMPL)
--
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
--
-- Command effects on the channel manager 
--    channel identifier, polarity, component to be queued, list of channels to be modified
--
----------------------------------------------------------------------

putch:: Int -> POLARITY -> QUEUE -> [AMPLCHANNEL] -> [AMPLCHANNEL]
putch _ _ _ [] = error "ERROR: No channels!"
putch n pol v ((m,q,q'):chs)
       | n==m && pol==OUT = (m,putq v q,q'):chs
       | n==m && pol==IN = (m,q,putq v q'):chs
       | otherwise = (m,q,q'):(putch n pol v chs)
     where
        putq v (Q_PUT v' q) = (Q_PUT v' (putq v q))
        putq v (Q_HPUT n q) = (Q_HPUT n (putq v q))
        putq v Q_EMPTY = v
        putq v _ = error "ERROR: Inappropriate queue state!"

--
--  Utilities for command implementation:
--  get_ch takes a channel , a channel polarity , the process suspension and  a channel manager and returns a channel manager.
--
get_ch:: Int -> POLARITY -> SUSPENSION -> CHM -> CHM
get_ch ch pol suspended (names, chs) = (names, putch ch pol (Q_GET suspended) chs)

put_ch::  Int -> POLARITY -> VAL -> CHM -> CHM
put_ch ch pol val (names, chs) = (names, putch ch pol (Q_PUT val Q_EMPTY) chs)

-- split takes a channel and divides it into 2 channel names
split_ch:: Int -> POLARITY -> CHM -> ((Int,Int),CHM)
split_ch ch pol (names,chs) = ((ch1,ch2),(names2,chs2))
    where (ch1,names1) = newname names -- newname takes the list of used channels and pro
          (ch2,names2) = newname names1
          chs1 = putch ch pol (Q_SPLIT (ch1,ch2)) chs
          chs2 = (ch1,Q_EMPTY,Q_EMPTY):(ch2,Q_EMPTY,Q_EMPTY):chs1

close_ch:: Int -> POLARITY -> CHM -> CHM
close_ch ch pol (names,chs) = (names,putch ch pol Q_CLOSE chs)

halt_ch:: Int -> POLARITY -> CHM -> CHM
halt_ch ch pol (names,chs) = (names,putch ch pol Q_HALT chs)

hput_ch :: Int -> POLARITY -> Int -> CHM -> CHM
hput_ch ch pol n (names,chs) = (names, putch ch pol (Q_HPUT n Q_EMPTY) chs) 

-- for the global channel names
newname :: [Int] -> (Int,[Int])
newname names = newname' 0 names

newname' :: Int -> [Int] -> (Int,[Int])
newname' n [] = (n,[n])
newname' n (m:ms)
         | n<m = (n,n:m:ms)
         | otherwise = (\(n',ns) -> (n',m:ns)) (newname' (n+1) ms)

remove_name _ [] = []
remove_name n (m:ms)| n==m = ms
                    | otherwise = m:(remove_name n ms)

get_from_list str list n | n < 0 = error (str++"Index negative"++(show n))
                         | n >= (length list) = error (str++"Index too large  "++(show n)++"  in  "++(show list))
                         | otherwise = list !! n

-- for the translation tables
lookup_t str [] = error "Error: translation of name not found"
lookup_t str ((str',pol,ch):rest)
        | str==str' = (ch,pol)
        | otherwise = lookup_t str rest


remove_trans _ [] = error "Error: translation of name not found while removing it"
remove_trans str ((str',pol,ch):ms)
           | str==str' = ms
           | otherwise = (str',pol,ch):(remove_trans str ms)

restrict_trans [] names = []
restrict_trans ((str,pol,ch):ts) names
   | inlist str names = ((str,pol,ch):(restrict_trans ts names))
   | otherwise = (restrict_trans ts names)

compose_trans [] _ = []
compose_trans ((n,pol,m):rest) t | pol == pol' = (n,pol',n'):(compose_trans rest t) 
                                 | otherwise = error "Polarity mismatch in process call!"
   where (n',pol') = lookup_t m t

inlist a [] = False
inlist a (b:rest)
   | a==b = True
   | otherwise = inlist a rest

lookup_defn:: String -> DEFNS -> AMPLCOMS
lookup_defn str [] = error ("Error: definition of name <"++str++"> not found")
lookup_defn str ((str',c):rest)
        | str==str' = c
        | otherwise = lookup_defn str rest


----------------------------------------------------------------------------------------------------------
--
--    Machine actions: using a simple process then interact cycle 
--   (this strategy starves the processing by delaying all interaction until there is no processing to be done
--    ... a better strategy for parallelism would be to arrange there are as many active processes as possible
--    i.e. by performing all interactions first)
--
----------------------------------------------------------------------------------------------------------
run_cm':: (PROCESS,CHM,DEFNS) -> IO MACH
run_cm' (p,chm,defns) = run_cm ([p],chm,defns)

run_cm:: MACH -> IO MACH
run_cm s = do
     s' <- action_ps s
     if s == s' 
       then do
        return s 
       else do
        run_cm s'
----------------------------------------------------------------------------------------
action_ps:: MACH -> IO MACH 
action_ps (p:ps,chs,defs) = do
      (ps',chs') <- find_interact chs
      if chs == chs' then let (p',chs') = process_step p chs defs  in return (p'++ps,chs',defs)
                     else return(ps'++(p:ps),chs',defs)
         
action_ps ([],chs,defs) = do
      (ps',chs') <- find_interact chs
      return (ps',chs',defs)
   
     
---------------------------------------------------------------------------------
--
-- Channel interaction step (modify to interact with terminal when channel is -1).
--
---------------------------------------------------------------------------------

find_interact:: CHM -> IO MACH'
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
find_interact (names,[]) = return ([],(names,[]))
---------------------------------------------------------------------------------
find_interact (names,(ch,Q_HPUT n q,Q_GET (s,t,e,(AMC_hcase coms):xs)):chs) = 
                                    return ([(s,t,e,ci)],(names,(ch,q,Q_EMPTY):chs))
                                     where 
                                     ci = coms !! (n-1)
---------------------------------------------------------------------------------------
find_interact (names,(ch,Q_GET (s,t,e,(AMC_hcase coms):xs), Q_HPUT n q):chs) =
                                    return ([(s,t,e,ci)],(names,(ch,Q_EMPTY,q):chs))
                                    where 
                                    ci =  get_from_list "interact!!" coms (n-1)
---------------------------------------------------------------------------------------

find_interact (names,(ch,Q_PUT v q',Q_GET (s,t,e,c)):chs)
                                   = return ([(v:s,t,e,c)],(names,(ch,q',Q_EMPTY):chs))
---------------------------------------------------------------------------------------
find_interact (names,(ch,Q_GET (s,t,e,c),Q_PUT v q'):chs)
                                   = return ([(v:s,t,e,c)],(names,(ch,Q_EMPTY,q'):chs))
---------------------------------------------------------------------------------------
find_interact (names,(ch, Q_SPLIT (ch1,ch2), Q_FORK (t,e,((nam1,names1,c1),(nam2,names2,c2)))):chs) = 
    return ([p1,p2],(names',chs))
    where
      p1 = ([],(nam1,IN,ch1):(restrict_trans t names1),e,c1)
      p2 = ([],(nam2,IN,ch2):(restrict_trans t names2),e,c2)
      names' = remove_name ch names 
--------------------------------------------------------------------------------------------------
find_interact (names,(ch, Q_FORK (t,e,((nam1,names1,c1),(nam2,names2,c2))), Q_SPLIT (ch1,ch2)):chs)
                                  = return ([p1,p2],(names',chs))
    where              
      p1 = ([],(nam1,OUT,ch1):(restrict_trans t names1),e,c1)
      p2 = ([],(nam2,OUT,ch2):(restrict_trans t names2),e,c2)
      names' = remove_name ch names
-----------------------------------------------------------------------------
find_interact (names, (ch,Q_CLOSE,Q_HALT):chs) = return ([],(remove_name ch names,chs))
find_interact (names, (ch,Q_HALT,Q_CLOSE):chs) = return ([],(remove_name ch names,chs))
find_interact (names,(xch@(ch,_,_)):chs) 
   | ch <= 0  = find_service (names,xch:chs) 
   | otherwise = do 
               (p,(names',chs')) <- find_interact (names,chs)
               return (p,(names',xch:chs'))


-----------------------------------------------------------------------------
--  SERVICES
-----------------------------------------------------------------------------

find_service (names,(0,Q_EMPTY,Q_HPUT 1 (Q_GET (s,t,e,c))):chs) = do
                    putStrLn ("Console:")
                    putStrLn "Enter the number" 
                    num <- fmap (read::String -> Int) getLine
                    return ([((V_INT num):s,t,e,c)],(names,(0,Q_EMPTY,Q_EMPTY):chs))
---------------------------------------------------------------------------------
find_service (names,(0,Q_EMPTY,Q_HPUT 2 (Q_PUT (V_INT m) q)):chs) = do 
                    putStrLn ("Console:")
                    putStrLn (show m)
                    return ([],(names ,(0,Q_EMPTY,q):chs))
-------------------------------------------------------------------------------------
find_service (names,(0,Q_EMPTY,Q_HPUT 3 q):chs) = do
                    putStrLn ("Console:")
                    putStrLn ("Close")
                    return ([],(names,(0,Q_CLOSE,q):chs))
-------------------------------------------------------------------------------------
find_service (names,(n,Q_HPUT 1 (Q_GET (s,t,e,c)),Q_EMPTY):chs) = do
                    putStrLn ("Opening Channel "++(show n))
                    let comm = "x-terminal-emulator -e \"bash -c ' echo Please enter a number ;  nc localhost 44447 ' \" "
                    x <- runCommand $ comm 
                    snum <- communicate (fromInteger 44447)
                    let num = (read snum ):: Int  
                    return ([((V_INT num):s,t,e,c)],(names,(n,Q_EMPTY,Q_EMPTY):chs))
---------------------------------------------------------------------------------
find_service (names,(n,Q_HPUT 2 (Q_PUT (V_INT m) q),Q_EMPTY):chs) = do 
                    putStrLn ("Channel "++(show n))
                    putStrLn (show m)
                    return ([],(names ,(n,q,Q_EMPTY):chs))
-------------------------------------------------------------------------------------
find_service (names,(n,Q_HPUT 3 q, Q_EMPTY):chs) = do
                    putStrLn ("Channel "++(show n))
                    putStrLn ("Close")
                    return ([],(names,(n,q,Q_HALT):chs))

-------------------------------------------------------------------------------------                            
find_service (names,xch:chs)  = do 
                    (p,(names',chs')) <- find_interact (names,chs)
                    return (p,(names',xch:chs'))

                           
---------------------------------------------------------------------------------
-- Concurrent machine ..
---------------------------------------------------------------------------------

process_step:: PROCESS -> CHM -> DEFNS -> MACH'
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
--    Given a single process this describes how it modifies  
--    the channel manager and what process(es) it produces 
---------------------------------------------------------------------------------
process_step (v:s,t,e,(AMC_PUT n):cs) chs defs = ([(s,t,e,cs)], chs')
   where 
     (ch,pol) = lookup_t n t
     chs' = put_ch ch pol v chs
---------------------------------------------------------------
process_step (s,t,e,(AMC_GET n):cs) chs defs = ([],chs')
   where 
     (ch,pol) = lookup_t n t
     chs' = get_ch ch pol (s,t,e,cs) chs
-----------------------------------------------------------------
process_step (s,t,e,(AMC_HPUT n cn):cs) chs defs = ([(s,t,e,cs)],chs')
   where 
     (ch,pol) = lookup_t n t
     chs' = hput_ch ch pol cn chs
---------------------------------------------------------------------------
process_step (s,t,e,(AMC_HCASE n lc):cs) (names,chs) defs = ([],(names,chs'))
   where 
     (ch,pol) = lookup_t n t
     chs'     = putch ch pol (Q_GET (s,t,e,[AMC_hcase lc])) chs
---------------------------------------------------------------------------
process_step (s,t,e,(AMC_SPLIT n (n1,n2)):cs) chs defs = ([(s,t',e,cs)],chs')
   where
     (ch,pol) = lookup_t n t
     ((ch1,ch2),chs') = split_ch ch pol chs
     t' = (n1,pol,ch1):(n2,pol,ch2):(remove_trans n t)
-------------------------------------------------------------------------------
process_step (s,t,e,(AMC_FORK n fork_instr):_) (names,chs) defs = ([],(names,chs'))
   where
     (ch,pol) = lookup_t n t
     chs' = putch ch pol (Q_FORK (t,e,fork_instr)) chs

------------------------------------------------------------------------------
process_step (s,t,e,(AMC_CLOSE n):cs) (names,chs) defs = ([(s,t,e,cs)],(names,chs'))
   where
     (ch,pol) = lookup_t n t
     chs' = putch ch pol Q_CLOSE chs
----------------------------------------------------------------------------
process_step (_,t,e, [(AMC_HALT n)]) (names,chs) defs = ([],(names,chs'))
   where
     (ch,pol) = lookup_t n t
     chs' = putch ch pol Q_HALT chs
-------------------------------------------------------------
process_step ([],t,e,[AMC_PLUG chs (chs1,c1) (chs2,c2)]) chm defs
  = ([([],t1,e,c1),([],t2,e,c2)],chm')  -- needs work
   where
      (outchs,inchs,chm') = plug_chs chs chm
      t1 = outchs ++(restrict_trans t chs1)
      t2 = inchs ++ (restrict_trans t chs2)

      plug_chs [] chm = ([],[],chm)
      plug_chs (n:ns) chm = ((n,OUT,n'):ins',(n,IN,n'):outs',chm'')
          where (ins',outs',chm') = plug_chs ns chm
                (n',chm'') = plug_ch chm'
      plug_ch:: CHM -> (Int,CHM)     -- needs changing
      plug_ch (names,chs) = (ch',(names',chs')) 
           where
               (ch',names') = newname names
               chs' = (ch',Q_EMPTY,Q_EMPTY):chs
-------------------------------------------------------------
process_step (s,t,e,[AMC_RUN t' pn m]) chs defs = ([([],t'',e',c)], chs) 
           where e' = take m s
                 c = lookup_defn pn defs
                 t'' = compose_trans t' t
-------------------------------------------------------------        
process_step (s,t,e,c) chs defs = ([(s',t,e',c')],chs)
   where
      (c',e',s') = seq_step (c,e,s) defs
            

-- Executing the machine until the final state is reached

eval n ([],e,s) defs = (n, (s,e))
eval n s defs = eval (n+1) (seq_step s defs) defs

type SEQAMPL = (AMPLCOMS,ENV,STACK)

---------------------------------------------------------------------------------
--
--  Sequential machine steps
--
---------------------------------------------------------------------------------
seq_step:: SEQAMPL -> DEFNS -> SEQAMPL
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
seq_step ((AMC_LOAD n):c,e,s) defs = (c,e,x:s)
                         where x = case get_from_list "Access!!" e (n-1) of
                                     V_CLO(c,e) ->  error ("Closure <"++(show (V_CLO(c,e)))++"> taken from  environment!!")
                                     x -> x
------------------------------------------------------------------------------
seq_step (AMC_STORE:c,e,v:s) defs = case v of 
                                      V_CLO(c,e) ->  error ("Closure <"++(show (V_CLO(c,e)))++"> put in environment!!")
                                      v ->  (c,v:e,s) --- storing a value on the stack
------------------------------------------------------------------------------
seq_step ((AMC_CALL fn n):c',e,s) defs = (c,args,V_CLO (c',e):s')
      where args = take n s
            s' = drop n s
            c = lookup_defn fn defs
------------------------------------------------------------------------------
seq_step ([AMC_FRET],e,V_CLO(c',e'):s) defs = (c',e',s)
------------------------------------------------------------------------------
seq_step ([AMC_RET],e,v:V_CLO(c',e'):s) defs = (c',e',v:s)
------------------------------------------------------------------------------
seq_step ((AMC_CONS i n):c,e,s) defs
                  | n <= length s = (c,e,V_CONS(i,sl):s')
                  | otherwise     = error "Inappropriate stack state"
                   where sl = take n s 
                         s' = drop n s                          
------------------------------------------------------------------------------
seq_step ((AMC_CASE cs):c,e,V_CONS(i,sl):s) defs = (ci,sl ++ e,V_CLO(c,e):s)
                          where ci = get_from_list "Case!" cs (i-1)
------------------------------------------------------------------------------
seq_step ((AMC_REC cl):c,e,s ) defs = (c,e,(V_REC(cl,e)):s) 
------------------------------------------------------------------------------
seq_step ((AMC_DEST i n):c,e,s) defs
                  | n+1 <= length s = (ci,sl ++ e',V_CLO (c,e):s')
                  | otherwise     = error "Inappropriate stack state"
                   where sl = take n s 
                         (s',e',ci) = case drop n s of 
                                  (V_REC(cs,e'):s') -> (s',e',get_from_list "Record!" cs (i-1))
                                  _ -> error "Expected a record !!"                         
------------------------------------------------------------------------------
seq_step ((AMC_INT k):c,e,s) defs = (c,e,(V_INT k): s)
------------------------------------------------------------------------------
seq_step (AMC_ADD:c,e,V_INT n:V_INT m:s) defs = (c,e,V_INT (n + m):s)
------------------------------------------------------------------------------
seq_step (AMC_MUL:c,e,V_INT n:V_INT m:s) defs = (c,e,V_INT(n * m):s)
------------------------------------------------------------------------------
seq_step (AMC_LEQ:c,e,V_INT n:V_INT m:s) defs| n<= m = (c,e,V_CONS(2,[]):s)
                                             | otherwise = (c,e,V_CONS(1,[]):s)
------------------------------------------------------------------------------
seq_step ms defs = ms --error ("no sequential step from"++(show ms))


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

