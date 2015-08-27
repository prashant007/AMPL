{-# LANGUAGE DeriveGeneric #-}

module Main where 

import System.Environment ( getArgs)
import System.IO 

import Syntax.STConverter (transAMPLCODE)

import  Syntax.TypesAMPL 
import qualified Syntax.ErrM  as E

import Semantics.AMPL_am 

import qualified MyParser.AMPLParserMeta as M
import MyParser.InterpretAMPL

import Text.PrettyPrint
import Text.PrettyPrint.GenericPretty


import Language.LBNF.Runtime
import Language.LBNF.Compiletime

import System.IO
import System.Console.ANSI 



--type ParseFun = [Token] -> E.Err  S.AMPLCODE
myLLexer = M.resolveLayout True . M.myLexer

main = do  
   args <- getArgs
   let fileName = args !! 0
   contents <- readFile fileName  
   let tokens = myLLexer contents
   let conctree = M.pAMPLCODE tokens
   case conctree of
       Bad s     -> putStrLn $ "error in parsing" ++ s
       Ok  tree  -> do
             let  convOutPut  =  transAMPLCODE tree 
                  compiled = (compile_all convOutPut)
                  prettyPrintedAST  = prettyStyle zigStyle convOutPut
                  prettyPrintedCode = prettyStyle zigStyle (compiled::MACH)
                  path1 = "/home/prashant/Desktop/Program/Abstract_Machine/myAMPL/src/Output/AST.txt"
                  path2 = "/home/prashant/Desktop/Program/Abstract_Machine/myAMPL/src/Output/Code.txt"
             writeFile path1 prettyPrintedAST   
             writeFile path2 prettyPrintedCode   
             putStrLn "**************************************************************************"
             putStrLn "**************************************************************************"
             putStrLn "The AST and the code will be generated in the folder named Output."
             putStrLn "**************************************************************************"
             putStrLn "Do you want to display the code on screen as well(y/n?)"
             putStrLn "**************************************************************************"
             putStrLn "**************************************************************************"    
             choice <- getLine
             case choice of
                ("y") -> do
                        putStrLn "**************************************************************************"     
                        putStrLn "**************************ABSTRACT SYNTAX TREE****************************"
                        putStrLn "**************************************************************************"     
                        putStrLn prettyPrintedAST                      
                        putStrLn "**************************************************************************"     
                        putStrLn "**************************INTERPRETER RESULT******************************"
                        putStrLn "**************************************************************************"    
                        --putStrLn prettyPrintedCode
                        putStrLn "****************************************************************"
                        putStrLn "Running Code"
                        putStrLn "****************************************************************"
                        putStrLn "**************************************************************************"     
                        putStrLn "**************************INTERPRETER REMAINING******************************"
                        putStrLn "**************************************************************************"    
                        --putStrLn prettyPrintedCode1

                ("n") -> do
                  putStrLn "****************************************************************"
                  putStrLn "Running Code"
                  putStrLn "****************************************************************"
             ans <- run_cm' compiled
             hSetSGR stdout  [Reset]
             let prettyPrintedCode1 = prettyStyle zigStyle (ans::MACH)
                 path3 = "/home/prashant/Desktop/Program/Abstract_Machine/myAMPL/src/Output/Remaining.txt"
             putStrLn $ "\n" ++ prettyPrintedCode1
             writeFile path3 prettyPrintedCode1    
             

            

zigStyle :: Style
zigStyle = Style {mode = PageMode, lineLength = 30, ribbonsPerLine = 1.5}

