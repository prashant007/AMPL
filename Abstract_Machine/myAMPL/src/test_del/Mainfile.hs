module Main where 

import System.Environment ( getArgs)
import System.IO 

import TypesAMPL

import Language.LBNF.Compiletime
import Language.LBNF.Runtime
import AMPLParserMeta

import Text.PrettyPrint
import Text.PrettyPrint.GenericPretty

main = do  
   args <- getArgs
   let fileName = args !! 0  
   contents <- readFile fileName  
   let tokens = myLexer contents
   let conctree = pAMPLCODE tokens
   case conctree of
      Bad msg   -> putStrLn msg
      Ok  tree  -> putStrLn tree
   


