module MyParser.InterpretAMPL where

import Syntax.TypesAMPL
import Semantics.AMPL_am


--------------------------------------------------------------------------------------
--  Global Symbol table 
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--  Global Symbol table 
--------------------------------------------------------------------------------------

data SYM_ENTRY = S_HAND   [(String,Int)]
               | S_CHAND  [(String,Int)]
               | S_CONSTR [(String,Int,Int)]
               | S_DESTR  [(String,Int,Int)]
               | S_FUN Int
               | S_PROC Int (Int,Int)
   deriving (Eq,Show)

type SYM_TBL = [(String,SYM_ENTRY)]

data SYM_VALUES = SYM_CONSTR Int Int
                | SYM_DESTR Int Int
                | SYM_HANDLE Int
                | SYM_COHANDLE Int
                | SYM_FUN Int
                | SYM_PROCESS Int (Int,Int)
   deriving (Eq,Show)


collect_symbols:: AMPLCODE  -> SYM_TBL
collect_symbols ( AMPLcode hs chs cs ds ps fs _ ) = st
     where
            st1 = collect_handles hs []
            st2 = collect_cohandles chs st1
            st3 = collect_constructors cs st2
            st4 = collect_destructors ds st3
            st5 = collect_processes ps st4
            st =  collect_functions fs st5

            collect_handles [] st = st
            collect_handles ((Handle_spec pname hs):rest) st = st'
                   where
                        st1 = collect_handles rest st
                        st' = (pname,S_HAND (zipWith (\x y -> (x,y))  hs nums)):st1
            collect_cohandles [] st = st
            collect_cohandles ((Handle_spec pname hs):rest) st = st'
                   where
                        st1 = collect_cohandles rest st
                        st' = (pname,S_CHAND (zip hs [1..])):st1
            collect_constructors [] st = st
            collect_constructors ((Struct_spec ht hs):rest) st = st'
                   where
                        st1 = collect_constructors rest st
                        st' = (ht,(S_CONSTR (zipWith (\(s,m) n -> (s,n,m)) hs nums))):st1
            collect_destructors [] st = st
            collect_destructors ((Struct_spec ht hs):rest) st = st'
                   where
                        st1 = collect_destructors rest st
                        st' = (ht,S_DESTR (zipWith (\(s,m) n -> (s,n,m)) hs nums)):st1
            collect_functions [] st = st
            collect_functions ((Function_specf f vs  _):rest) st = st'
                   where
                        st1 = collect_functions rest st
                        st' = (f,S_FUN (length vs)) :st1
            collect_functions ((Function_spec f  _):rest) st = st'
                   where
                        st1 = collect_functions rest st
                        st' = (f,S_FUN 0) :st1
            collect_processes [] st = st
            collect_processes ((Process_specf p vs (ins,outs) _):rest) st = st'
                   where
                        st1 = collect_processes rest st
                        st' = (p,S_PROC (length vs) ((length ins),(length outs))) :st1
            collect_processes ((Process_spec p  (ins,outs) _):rest) st = st'
                   where
                        st1 = collect_processes rest st
                        st' = (p,S_PROC 0 ((length ins),(length outs))) :st1
--------------------------------------------------------------------------------------------------
-- Symbol table look up facilities
--------------------------------------------------------------------------------------------------

look_up_sym:: SYM_TBL -> String -> SYM_VALUES
look_up_sym [] str = error ("Symbol <"++str++"> not in scope.")
look_up_sym ((str',entry):rest) str | str==str' = case entry of 
                                          S_FUN n ->     SYM_FUN n
                                          S_PROC n pq -> SYM_PROCESS n pq
                                          _ -> error ("Symbol <"++str++"> is not a function or process.")
                                    | otherwise = look_up_sym rest str 

look_up_syms [] (s_1,s_2) = error ("Symbol <"++s_1++"."++s_2++"> not in scope.")
look_up_syms ((str,entry):rest) (s_1,s_2) 
        | str==s_1 = case entry of 
                      S_CONSTR constrs -> find_constr constrs 
                        where find_constr [] =  error ("Symbol <"++s_1++"."++s_2++"> not in scope.")
                              find_constr ((s,n,m):rest) 
                                    | s==s_2 = SYM_CONSTR n m
                                    | otherwise = find_constr rest
                      S_DESTR destrs -> find_destr destrs 
                        where find_destr [] =  error ("Symbol <"++s_1++"."++s_2++"> not in scope.")
                              find_destr ((s,n,m):rest) 
                                    | s==s_2 = SYM_DESTR n m
                                    | otherwise = find_destr rest
                      S_HAND hands -> find_hand hands
                        where find_hand [] =  error ("Symbol <"++s_1++"."++s_2++"> not in scope.")
                              find_hand ((s,n):rest) 
                                    | s==s_2 = SYM_HANDLE n
                                    | otherwise = find_hand rest
                      S_CHAND hands -> find_chand hands 
                        where find_chand [] =  error ("Symbol <"++s_1++"."++s_2++"> not in scope.")
                              find_chand ((s,n):rest) 
                                    | s==s_2 =  SYM_COHANDLE n
                                    | otherwise = find_chand rest
                      _ -> error ("Symbol <"++s_1++"> is a function or process not a type.")
         | otherwise = look_up_syms rest (s_1,s_2) 

look_up_syms_structs [] (s_1,s_2) = error ("Symbol <"++s_1++"."++s_2++"> not in scope.")
look_up_syms_structs ((str,entry):rest) (s_1,s_2) 
        | str==s_1 = case entry of 
                      S_CONSTR constrs ->  map (\(s,_,_) -> s) constrs 
                      S_DESTR destrs -> map (\(s,_,_) -> s) destrs 
                      S_HAND hands -> map (\(s,_) -> s) hands
                      S_CHAND hands -> map (\(s,_) -> s) hands
        | otherwise = look_up_syms_structs rest (s_1,s_2) 

------------------------------------------------------------------------------------------------------
--Utilities for compiling
------------------------------------------------------------------------------------------------------
type TRANSLATION = [(String,POLARITY,Int)]

translate trans str = ch_num
   where (ch_num,_) = look_up_translation trans str
translate_list trans xs = map (translate trans) xs

look_up_translation:: TRANSLATION -> String -> (Int,POLARITY)
look_up_translation [] str = error ("Channel name <"++str++"> not in scope")
look_up_translation ((str',p,n):rest) str| str'==str = (n,p)
                                         | otherwise = look_up_translation rest str

restrict_translation:: Eq a => [(a,POLARITY,Int)] -> [a] -> [(a,POLARITY,Int)]
restrict_translation trans strs = filter (\(x,_,_) -> inlist x strs) trans

next_channel_num m [] = m
next_channel_num m ((_,_,n):rest) | m <= n = next_channel_num (n+1) rest
                                  | otherwise = next_channel_num m rest

load_args stack args = load_args1 [] args
  where load_args1 ls [] = ls
        load_args1 ls (arg:args) = load_args1 ((AMC_LOAD (depth_in_stack stack arg)):ls) args


--load_args stack [] = []
--load_args stack (arg:args) = (AMC_LOAD (depth_in_stack stack arg)):(load_args stack args)

store_args [] = []
store_args (_:rest) = AMC_STORE:(store_args rest)

depth_in_stack = depth 1 
  where
    depth n [] str = error ("Variable <"++str++"> not in scope!")
    depth n (str':rest) str | str' == str = n
                            | otherwise = depth (n+1) rest str
    
nums = 1:(map (\x -> x+1) nums)

------------------------------------------------------------------------------------------------------
-- Top level compilation
------------------------------------------------------------------------------------------------------

compile_process_defn :: SYM_TBL -> PROCESS_SPEC -> DEFN  
compile_process_defn sym (Process_specf pname vars (in_ch,out_ch) cs) 
   = (pname,amcs)
       where amcs = compile_process sym vars t cs
             t =  zipWith  (\(x,p) n -> (x,p,n)) 
                           ((map (\x -> (x,IN)) in_ch)++(map (\x -> (x,OUT)) out_ch))
                           nums
compile_process_defn sym (Process_spec pname ch_spec cs) 
   = (pname,compile_process sym [] [] cs)

compile_function_defn :: SYM_TBL -> FUNCTION_SPEC -> DEFN
compile_function_defn  sym  (Function_specf fname vars cs)
   = (fname,amcs)
      where amcs = compile_fun sym vars cs
compile_function_defn  sym  (Function_spec fname cs)
   = (fname,compile_fun sym [] cs)

compile_run sym (Channel_specf in_chs out_chs,coms) = (trans',code) 
     where 
         code = compile_process sym [] trans coms
         trans = (map (\x -> (x,IN,services_AMPL IN x)) in_chs) 
                         ++ (map (\x -> (x,OUT,services_AMPL OUT x)) out_chs)
         trans' = map (\(_,p,x) -> (x,p,x)) trans
compile_run sym (Channel_spec in_chs out_chs,coms) = (trans,code) 
     where 
         code = compile_process sym [] [] coms
         trans = (map (\x -> if x <= 0 then (x,IN, x) else error "Services on positive channels not provided.") in_chs) 
                   ++ (map (\x -> if x <= 0 then (x,OUT, x) else error "Services on positive channels not provided.") out_chs)

------------------------------------------------------------------------------------------------------
--
-- Services provided by AMPL
--
------------------------------------------------------------------------------------------------------

services_AMPL IN "console" = 0
services_AMPL OUT "intTerm1" = -1
services_AMPL OUT "intTerm2" = -2
services_AMPL OUT "intTerm3" = -3
services_AMPL OUT "intTerm4" = -4
services_AMPL OUT "intTerm5" = -5
services_AMPL _ str = error ("Service <"++str++"> not supported.")

compile_all prog@(AMPLcode _ _ _ _ ps fs cs) = (mach_st,chm, defns)
   where  sym = collect_symbols prog
          defns = (map (compile_process_defn sym) ps)
                        ++(map (compile_function_defn sym) fs)
          (trans,code) = compile_run sym cs
          chs = map (\(x,_,_) -> x) trans
          empty_queues = map (\x -> (x,Q_EMPTY,Q_EMPTY)) chs
          mach_st = ([],trans,[],code)
          chm = (chs,empty_queues)


------------------------------------------------------------------------------------------------------
-- Compiling function code
------------------------------------------------------------------------------------------------------

compile_fun:: SYM_TBL -> [String]  -> [COM] -> [AMPLCOM] 
compile_fun sym stack [] = []
compile_fun sym stack (AC_STORE:rest) = AMC_STORE:(compile_fun sym ("_":stack) rest)
compile_fun sym stack ((AC_STOREf var):rest) = AMC_STORE:(compile_fun sym (var:stack) rest)
compile_fun sym stack ((AC_LOADf var):rest) = (AMC_LOAD m):(compile_fun sym stack rest)
       where m = depth_in_stack stack var
compile_fun sym stack ((AC_LOAD m):rest) = (AMC_LOAD m):(compile_fun sym stack rest)
compile_fun sym stack ((AC_RET):rest) = AMC_RET:(compile_fun sym stack rest)
compile_fun sym stack ((AC_FRET):rest) = AMC_FRET:(compile_fun sym stack rest)
compile_fun sym stack ((AC_CALLf fn args):rest) = 
   case look_up_sym sym fn of 
        SYM_FUN n -> if n==(length args) then (load_args stack args)++((AMC_CALL fn n):(compile_fun sym stack rest))
                                          else error ("Function <"++fn++"> called with incorrect number of arguments.")
        _ -> error ("Function <"++fn++"> not defined!!")
compile_fun sym stack ((AC_CALL fn n):rest) = (AMC_CALL fn n):(compile_fun sym stack rest)
compile_fun sym stack ((AC_INT n):rest) = (AMC_INT n):(compile_fun sym stack rest)
compile_fun sym stack ((AC_LEQ):rest) = (AMC_LEQ):(compile_fun sym stack rest)
compile_fun sym stack ((AC_MUL):rest) = (AMC_MUL):(compile_fun sym stack rest)
compile_fun sym stack ((AC_ADD):rest) = (AMC_ADD):(compile_fun sym stack rest)
compile_fun sym stack ((AC_CONS n m):rest) = (AMC_CONS n m):(compile_fun sym stack rest)
compile_fun sym stack ((AC_DEST n m):rest) = (AMC_DEST n m):(compile_fun sym stack rest)
compile_fun sym stack ((AC_STRUCT (s1,s2) vars):rest) 
   = case look_up_syms sym (s1,s2) of
         SYM_CONSTR i n -> if n==(length vars) then (load_args stack vars)++(AMC_CONS i n):(compile_fun sym stack rest)
                                               else error ("Constructor applied <"++s1++"."++s2++"> appied an incorrect number of cariables.") 
         SYM_DESTR i n ->  if n==(length vars) then (load_args stack vars)++(AMC_DEST i n):(compile_fun sym stack rest)
                                               else error ("Destructor applied <"++s1++"."++s2++"> appied to an incorrect number of cariables.") 
         _ -> error "Function code: non constructors/destructors name used as structor!"
compile_fun sym stack ((AC_CASE cases):rest) 
   = (AMC_CASE (map (compile_fun sym stack) cases)):(compile_fun sym stack rest)
compile_fun sym stack ((AC_CASEf cases):rest)    --- working on this code and all like it!!!!
   = [AMC_CASE (constructor_headtype cases)]++(compile_fun sym stack rest)
     where constructor_headtype [] = error "Case expression: expected some cases!"
           constructor_headtype cases@(((head,struct),vars,cs):rest) = sorter 1 (constructor_headtype' head cases)
               where num_of = length (look_up_syms_structs sym (head,struct))
                     sorter n [] | (num_of+1)==n = []
                                 | otherwise = error ("Constructor "++(show n)++" missing!")
                     sorter n vs@((n',x):rest)| n==n' = x:(sorter (n+1) rest)
                                    | otherwise = v:(sorter (n+1) rest')
                                               where (v,rest') = pull_up n vs
                                                     pull_up n ((n',x):rest) | n==n' = (x,rest)
                                                                             | otherwise = case (pull_up n rest) of
                                                                                  (x',rest') -> (x',(n',x):rest')
                                                     pull_up n [] = error ("Constructor "++(show n)++" missing!")
 
           constructor_headtype' _ [] = []
           constructor_headtype' head (((head',struct),vars,cs):rest) 
                 | head==head' && (length vars)==arity 
                        = (cons_num,compile_fun sym (vars++stack) cs):(constructor_headtype' head rest)
                 | otherwise = error ("Case expression: all should have type <"++head++"> !!")
             where (cons_num,arity) = case look_up_syms sym (head,struct) of
                         (SYM_CONSTR cons_num arity) -> (cons_num,arity)
                         _ -> error ("Case expression: constructor <"++head++"."++struct++"> not found!")
         
compile_fun sym stack ((AC_RECORD cs):rest) 
   = (AMC_REC (map (compile_fun sym stack) cs)):(compile_fun sym stack rest) 
compile_fun sym stack ((AC_RECORDf recs):rest) 
   = (AMC_REC (destructor_headtype recs)):(compile_fun sym stack rest)
     where destructor_headtype [] = error "Record expression: expected some entries!"
           destructor_headtype cases@(((head,struct),vars,cs):rest) = sorter 1 (destructor_headtype' head cases)
              where num_of = length (look_up_syms_structs sym (head,struct))
                    sorter n [] | (num_of+1)==n = []
                                 | otherwise = error ("Destructor "++(show n)++" missing!")
                    sorter n vs@((n',x):rest)| n==n' = x:(sorter (n+1) rest)
                                    | otherwise = v:(sorter (n+1) rest')
                                               where (v,rest') = pull_up n vs
                                                     pull_up n ((n',x):rest) | n==n' = (x,rest)
                                                                             | otherwise = case (pull_up n rest) of
                                                                                  (x',rest') -> (x',(n',x):rest')
                                                     pull_up n [] = error ("Destructor "++(show n)++" missing!")
 
           destructor_headtype' _ [] = []
           destructor_headtype' head (((head',struct),vars,cs):rest) 
                 | head==head' && (length vars)==arity 
                             = (cons_num,(compile_fun sym (vars++stack) cs)):(destructor_headtype' head rest)
                 | otherwise = error ("Record expression: all should have type <"++head++"> !!")
                where
                   (cons_num, arity) = case look_up_syms sym (head,struct) of
                         SYM_DESTR cons_num arity -> (cons_num,arity)
                         _ -> error ("Record expression: destructor <"++head++"."++struct++"> not found!")
compile_fun _ _ c = error ("Process code in a function???!"++(show c))

------------------------------------------------------------------------------------------------------
-- Compiling process code
------------------------------------------------------------------------------------------------------


compile_process:: SYM_TBL -> [String] -> [(String,POLARITY,Int)] -> [COM] -> [AMPLCOM]
compile_process _ _ _ [] = []
compile_process sym stack trans (AC_STORE:rest) 
   = AMC_STORE:(compile_process sym ("_":stack) trans rest)
compile_process sym stack trans ((AC_STOREf var):rest) 
   = AMC_STORE:(compile_process sym (var:stack) trans rest)
compile_process sym stack chs ((AC_LOADf var):rest) 
   = (AMC_LOAD m):(compile_process sym stack chs rest)
       where m = depth_in_stack stack var
compile_process sym stack chs ((AC_LOAD m):rest) 
   = (AMC_LOAD m):(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_RET):rest) 
   = AMC_RET:(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_FRET):rest) 
   = AMC_FRET:(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_CALLf fn args):rest) 
   = case look_up_sym sym fn of 
         SYM_FUN n -> if n==(length args) then (load_args stack args)++ ((AMC_CALL fn n):(compile_process sym stack chs rest))
                      else error ("Function <"++fn++"> called with an incorrect number of arguments!")
         _ -> error ("Function <"++fn++">not defined!!")
compile_process sym stack chs ((AC_CALL fn n):rest) 
   = (AMC_CALL fn n):(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_INT n):rest) 
   = (AMC_INT n):(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_LEQ):rest) 
   = (AMC_LEQ):(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_MUL):rest) 
   = (AMC_MUL):(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_ADD):rest) 
   = (AMC_ADD):(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_CONS n m):rest) 
   = (AMC_CONS n m):(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_DEST n m):rest) 
   = (AMC_DEST n m):(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_STRUCT (s_1,s_2) vars):rest) 
   = case look_up_syms sym (s_1,s_2) of
         SYM_CONSTR i n -> if n == (length vars) then (load_args stack vars)++((AMC_CONS i n):(compile_process sym stack chs rest))
                                                 else error ("Constructor <"++s_1++"."++s_2++"> appied to an incorrect number of arguments!")
         SYM_DESTR i n ->  if n == (length vars) then (load_args stack vars)++((AMC_DEST i n):(compile_process sym stack chs rest))
                                                 else error ("Destructor <"++s_1++"."++s_2++"> appied to an incorrect number of arguments!")
         _ -> error "Process code: non constructor/destructor used as a structor!"
compile_process sym stack chs ((AC_CASE cs):rest) 
   =  (AMC_CASE (map (compile_process sym stack chs) cs)):(compile_process sym stack chs rest)
compile_process sym stack trans ((AC_CASEf cases):rest) 
   = (AMC_CASE (constructor_headtype cases)):(compile_process sym stack trans rest)
     where constructor_headtype [] = error "Case expression: expected some cases!"
           constructor_headtype cases@(((head,struct),vars,cs):rest) = sorter 1 (constructor_headtype' head cases)
              where num_of = length (look_up_syms_structs sym (head,struct))
                    sorter n [] | (num_of+1) == n = []
                                | otherwise = error ("Constructor "++(show n)++" missing!")
                    sorter n vs@((n',x):rest)| n==n' = x:(sorter (n+1) rest)
                                    | otherwise = v:(sorter (n+1) rest')
                                               where (v,rest') = pull_up n vs
                                                     pull_up n ((n',x):rest) | n==n' = (x,rest)
                                                                             | otherwise = case (pull_up n rest) of
                                                                                  (x',rest') -> (x',(n',x):rest')
                                                     pull_up n [] = error ("Constructor "++(show n)++" missing in case expression!")
           constructor_headtype' head [] = []
           constructor_headtype' head (((head',struct),vars,cs):rest) 
                 | head==head'&& (length vars)==arity 
                     = (cons_num,compile_process sym (vars++stack) trans cs):(constructor_headtype' head rest)
                 | otherwise = error "Case expression: not well-formed!"
               where 
                  (cons_num,arity) = case look_up_syms sym (head,struct) of
                         SYM_CONSTR cons_num arity -> (cons_num,arity)
                         _ -> error "Case expression: constructor not found!"
                
compile_process sym stack chs ((AC_RECORD cs):rest)
   = (AMC_REC (map (compile_process sym stack chs) cs)):(compile_process sym stack chs rest) 
compile_process sym stack trans ((AC_RECORDf recs):rest)
   = (AMC_REC (destructor_headtype recs)):(compile_process sym stack trans rest)
     where destructor_headtype [] = error "Record expression: expected some entries!"
           destructor_headtype recs@(((head,struct),_,_):_) = sorter 1 (destructor_headtype' head recs)
            where num_of = length(look_up_syms_structs sym (head,struct))
                  sorter n [] | (num_of+1)==n = []
                              | otherwise  = error ("Destructor "++(show n)++" missing!")
                  sorter n vs@((n',x):rest)| n==n' = x:(sorter (n+1) rest)
                                 | otherwise = v:(sorter (n+1) rest')
                                               where (v,rest') = pull_up n vs
                                                     pull_up n ((n',x):rest) | n==n' = (x,rest)
                                                                             | otherwise = case (pull_up n rest) of
                                                                                  (x',rest') -> (x',(n',x):rest')
                                                     pull_up n [] = error ("Destructor "++(show n)++" missing in record expression!")
           destructor_headtype' _ [] = []
           destructor_headtype' head (((head',struct),vars,cs):rest) 
                 | head==head' && (length vars)==arity 
                        = (des_num,(compile_process sym (vars++stack) trans cs)):(destructor_headtype' head rest)
                 | otherwise = error "Record expression: not well-formed!"
               where 
                  (des_num,arity) = case look_up_syms sym (head,struct) of
                         SYM_DESTR des_num arity -> (des_num,arity)
                         _ -> error "Record expression: destructor not found!"
compile_process sym stack trans ((AC_GETf str):rest) 
   = (AMC_GET cn):(compile_process sym stack trans rest)
      where (cn,_) = look_up_translation trans str 
compile_process sym stack chs ((AC_GET cn):rest) 
   = (AMC_GET cn):(compile_process sym stack chs rest)
compile_process sym stack chs ((AC_HPUT cn i):rest) 
   = (AMC_HPUT cn i):(compile_process sym stack chs rest)
compile_process sym stack trans ((AC_HPUTf ch (s_1,s_2)):rest) 
   = (AMC_HPUT cn i):(compile_process sym stack trans rest)
      where (cn,pol) = look_up_translation trans ch 
            i = report_handle_num pol (look_up_syms sym (s_1,s_2))
            report_handle_num OUT (SYM_HANDLE i) = i
            report_handle_num IN (SYM_COHANDLE i) = i
            report_handle_num _ _ = error ("Handle <"++s_1++"."++s_2++"> on channel <"++ch++"> of wrong polarity!!")
compile_process sym stack chs ((AC_PUT cn):rest) 
   =  (AMC_PUT cn):(compile_process sym stack chs rest)
compile_process sym stack trans ((AC_PUTf str):rest) 
   = (AMC_PUT cn):(compile_process sym stack trans rest)
      where (cn,_) = look_up_translation trans str 
compile_process sym stack trans ((AC_SPLIT ch (ch1,ch2)):rest) 
   =  (AMC_SPLIT ch (ch1,ch2)):(compile_process sym stack trans rest)
compile_process sym stack trans ((AC_SPLITf ch (ch1,ch2)):rest) 
   =  (AMC_SPLIT ch' (ch1',ch2')):(compile_process sym stack trans' rest)
     where (ch',pol) = look_up_translation trans ch
           ch1' = next_ch 1 trans
           ch2' = ch1'+1
           trans' = (ch1,pol,ch1'):((ch2,pol,ch2'):trans)
           next_ch n [] = n
           next_ch n ((_,p,m):rest)|m >= n = next_ch (m+1) rest
                                   | otherwise = next_ch n rest
-- | AC_FORKf String [(String,[String], [COM])]
compile_process sym stack trans ((AC_FORKf chn ((chn1,chns1,cs1),(chn2,chns2,cs2))): rest) 
   = (AMC_FORK ch ((ch1,chs1,compile_process sym stack trans1 cs1),(ch2,chs2,compile_process sym stack trans2 cs2))
                    ):(compile_process sym stack trans rest)
       where 
         (ch,pol) = look_up_translation trans chn
         ch1 = translate trans chn1
         ch2 = translate trans chn2
         chs1 = translate_list trans chns1
         chs2 = translate_list trans chns2
         trans1 = (chn1,pol,m):(restrict_translation trans chns1)
         trans2 = (chn2,pol,m):(restrict_translation trans chns2)
         m = next_channel_num 1 trans
compile_process sym stack trans ((AC_FORK ch ((ch1,chs1,cs1),(ch2,chs2,cs2))): rest) 
   = (AMC_FORK ch ((ch1,chs1,compile_process sym stack trans cs1),(ch2,chs2,compile_process sym stack trans cs2))
                    ):(compile_process sym stack trans rest)

compile_process sym stack trans ((AC_PLUGf chn (chns1,cs1) (chns2,cs2)):[] )  -- need to allow plugging on multiple channels
   = (AMC_PLUG [ch] (chs1,compile_process sym stack trans1 cs1) 
                    (chs2,compile_process sym stack trans2 cs2)):[] 
     where
        ch = next_channel_num 1 trans
        chs1 = translate_list trans chns1
        chs2 = translate_list trans chns2
        trans1 = (chn,OUT,ch):(restrict_translation trans chns1)
        trans2 = (chn,IN,ch):(restrict_translation trans chns2)


compile_process sym stack trans ((AC_PLUG chlist (chs1,c1) (chs2,c2)):[])   
   = (AMC_PLUG chs (chs1,compile_process sym stack trans c1) 
                   (chs2,compile_process sym stack trans c2)):[] 
     where
        chs = map (\(ch,_,_) -> ch) chlist

compile_process sym stack trans ((AC_ID ch1 ch2):c)
   = (AMC_ID ch1 ch2):(compile_process sym stack trans c)
compile_process sym stack trans ((AC_IDf chn1 chn2):c)
   = (AMC_ID (translate trans chn1) (translate trans chn2)):(compile_process sym stack trans c)

compile_process sym stack trans ((AC_CLOSEf str):rest) 
   = (AMC_CLOSE cn):(compile_process sym stack trans rest)
      where (cn,_) = look_up_translation trans str 
compile_process sym stack chs ((AC_CLOSE cn):rest) 
   =  (AMC_CLOSE cn):(compile_process sym stack chs rest)
compile_process sym stack trans ((AC_HALTf str):rest) 
   =  (AMC_HALT cn):(compile_process sym stack trans rest)
      where (cn,_) = look_up_translation trans str 
compile_process sym stack trans ((AC_HALT cn):rest) 
   =  (AMC_HALT cn):(compile_process sym stack trans rest)
compile_process sym stack trans [(AC_HCASEf str labcoms)]
   = [(AMC_HCASE cn comlist)]
     where
        (cn,pol) = look_up_translation trans str 
        comlist = process_headtype labcoms 
        process_headtype [] = error "Handler expression: expected some handlers!"
        process_headtype handlers@(((head,struct),cs):rest) = sorter 1 (process_headtype' head handlers)
          where num_of = length(look_up_syms_structs sym (head,struct))
                sorter n [] | (num_of+1)==n = []
                            | otherwise  = error ("Handler <"++(show n)++"> missing!")
                sorter n vs@((n',x):rest)| n==n' = x:(sorter (n+1) rest)
                                         | otherwise = v:(sorter (n+1) rest')
                                               where (v,rest') = pull_up n vs
                                                     pull_up n ((n',x):rest) | n==n' = (x,rest)
                                                                             | otherwise = case (pull_up n rest) of
                                                                                  (x',rest') -> (x',(n',x):rest')
                                                     pull_up n [] = error ("Handler <"++(show n)++"> missing!")
        process_headtype' head [] = []
        process_headtype' head (((head',struct),cs):rest) 
                 | head==head' = (h_num,(compile_process sym stack trans cs)):(process_headtype' head rest)
                 | otherwise = error "Handler expression: not well-formed!"
               where 
                  h_num = case (pol,look_up_syms sym (head,struct)) of
                         (IN,SYM_HANDLE h_num)  -> h_num
                         (OUT,SYM_COHANDLE h_num)  -> h_num
                         _ -> error "Handler expression: using wrong polarity of handler!"
compile_process sym stack chs ((AC_HCASE ch cs):rest)
   = (AMC_HCASE ch (map (compile_process sym stack chs) cs)):(compile_process sym stack chs rest)
compile_process sym stack trans [AC_RUNf pname vars (in_chs,out_chs)]
   = (load_args stack vars)++[(AMC_RUN newtrans pname (length vars))]
     where newtrans = if (length in_chs)==ins && (length out_chs)==outs && (length vars) == arity
               then zipWith (\y (p,x) -> (y,p,x)) nums ((map (\x -> (IN,x)) in_chs')++(map (\x -> (OUT,x)) out_chs'))
               else error ("Process <"++pname++"> run with inappropriate sequential or channel arguments!")
           (arity,(ins,outs))  = case look_up_sym sym pname of
                                     SYM_PROCESS arity (ins,outs) -> (arity,(ins,outs))
                                     _ -> error ("Expected <"++pname++"> to be a process")
           in_chs' = map (\x -> case look_up_translation trans x of
                                   (y,IN) -> y
                                   _ -> error ("Channel <"++x++"> has wrong polarity!")
                         ) in_chs
           out_chs' = map (\x -> case look_up_translation trans x of
                                   (y,OUT) -> y
                                   _ -> error ("Channel <"++x++"> has wrong polarity!")
                         ) out_chs

compile_process sym stack chs [(AC_RUN t pname n)] 
   = [AMC_RUN t pname n]
compile_process sym stack trans (x:rest) = error ("Unrecognized code <"++(show x)++"> in a process!!")