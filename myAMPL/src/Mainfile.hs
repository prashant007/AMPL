{-# LANGUAGE DeriveGeneric #-}

module Main where 

import System.Environment ( getArgs)
import System.IO 

import Syntax.STConverter (transAMPLCODE)

import qualified Syntax.TypesAMPL as T 
import qualified Syntax.ErrM  as E

import Semantics.AMPL_am 

import qualified MyParser.AMPLParserMeta as M
import MyParser.InterpretAMPL

import Text.PrettyPrint
import Text.PrettyPrint.GenericPretty


import Language.LBNF.Runtime
import Language.LBNF.Compiletime



--type ParseFun = [Token] -> E.Err  S.AMPLCODE
myLLexer = M.resolveLayout True . M.myLexer

main = do  
   --args <- getArgs
   --let fileName = args !! 0
   putStrLn "please Enter a file name" 
   fileName <- getLine
   contents <- readFile fileName  
   let tokens = myLLexer contents
   let conctree = M.pAMPLCODE tokens
   case conctree of
       Bad s     -> putStrLn $ "error in parsing" ++ s
       Ok  tree  -> do
        let  convOutPut  =  transAMPLCODE tree 
             compiled = (compile_all convOutPut)
        putStrLn "**************************************************************************"     
        putStrLn "**************************ABSTRACT SYNTAX TREE****************************"
        putStrLn "**************************************************************************"     
        ppStyle zigStyle convOutPut
        putStrLn "**************************************************************************"     
        putStrLn "**************************INTERPRETER RESULT******************************"
        putStrLn "**************************************************************************"    
        ppStyle zigStyle (compiled::(T.PROCESS,T.CHM,T.DEFNS))
        ans <- run_cm' compiled
        putStrLn (show (ans::T.MACH))
                    

zigStyle :: Style
zigStyle = Style {mode = PageMode, lineLength = 30, ribbonsPerLine = 1.5}

