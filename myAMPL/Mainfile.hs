module Main where 

import System.Environment ( getArgs, getProgName )
import Language.LBNF.Runtime


main = do  
   args <- getArgs  ????
   progName <- getProgName  
   putStrLn "The arguments are:"  
   mapM putStrLn args  
   putStrLn "The program name is:"  
   putStrLn progName  