module Testing where
import TypesAMPL
import AMPL_am


test_code_1 =            -- %start :
 [AMC_HPUT (-1) 1          -- hput -1 1  
 ,AMC_GET (-1)             -- get -1
 ,AMC_STORE              -- store 
 ,AMC_HPUT (-1) 1          -- hput -1 1
 ,AMC_GET (-1)             -- get -1
 ,AMC_STORE              -- store
 ,AMC_LOAD 2             -- load 2
 ,AMC_LOAD 1             -- load 1
 ,AMC_ADD                -- add
 ,AMC_HPUT (-1) 2          -- hput -1 2
 ,AMC_PUT (-1)             -- put  -1
 ,AMC_HPUT (-1) 3         -- hput -1 3
 ,AMC_CLOSE (-1)          -- close -1
 ,AMC_HPUT 0 3
 ,AMC_HALT 0]
         

test_code_2 =
   [AMC_HPUT (-1) 1          -- hput -1 1  
   ,AMC_GET (-1)             -- get -1
   ,AMC_STORE                -- store
   ,AMC_LOAD 1               -- load 1
   ,AMC_HPUT (-2) 2          -- hput -2 2
   ,AMC_PUT (-2)             -- put  -2
   ,AMC_HPUT (-2) 1          -- hput -2 1  
   ,AMC_GET (-2)             -- get -1
   ,AMC_STORE                -- store
   ,AMC_LOAD 1               -- load 1
   ,AMC_HPUT (-1) 2          -- hput -1 2
   ,AMC_PUT (-1)             -- hput -1
   ,AMC_HPUT (-2) 3          -- hput -2 3
   ,AMC_CLOSE (-2)            -- halt -2
   ,AMC_HPUT (-1) 3          -- hput -1 3
   ,AMC_CLOSE (-1)            -- halt -2
   ,AMC_HPUT 0 3
   ,AMC_HALT 0]

test_code_3 =            -- %start :
 [AMC_HPUT (-1) 1          -- hput -1 1  
 ,AMC_GET (-1)             -- get -1
 ,AMC_STORE              -- store 
 ,AMC_HPUT (-2) 1          -- hput -1 1
 ,AMC_GET (-2)             -- get -1
 ,AMC_STORE              -- store
 ,AMC_LOAD 2             -- load 2
 ,AMC_LOAD 1             -- load 1
 ,AMC_ADD                -- add
 ,AMC_HPUT (-1) 2          -- hput -1 2
 ,AMC_PUT (-1)             -- put  -1
 ,AMC_HPUT (-1) 3         -- hput -1 3
 ,AMC_CLOSE (-1)          -- close -1
 ,AMC_HPUT (-2) 3         -- hput -1 3
 ,AMC_CLOSE (-2)          -- close -1
 ,AMC_HPUT 0 3
 ,AMC_HALT 0]
         


testrun1 = run_cm ([([],[(-1,OUT,-1),(0,IN,0)],[],test_code_1)],([(-1),0],[(-1,Q_EMPTY,Q_EMPTY),(0,Q_EMPTY,Q_EMPTY)]),[])
testrun2 = run_cm ([([],[(-1,OUT,-1),(-2,OUT,-2),(0,IN,0)],[],test_code_2)],([(-2),(-1),0]
                          ,[(-1,Q_EMPTY,Q_EMPTY),(-2,Q_EMPTY,Q_EMPTY),(0,Q_EMPTY,Q_EMPTY)]),[])
testrun3 = run_cm ([([],[(-1,OUT,-1),(-2,OUT,-2),(0,IN,0)],[],test_code_3)],([(-1),(-2),0],[(-1,Q_EMPTY,Q_EMPTY),
                                                                             (-2,Q_EMPTY,Q_EMPTY),(0,Q_EMPTY,Q_EMPTY)]),[])
