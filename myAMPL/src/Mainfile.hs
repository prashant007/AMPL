module Main where 

import System.Environment ( getArgs)
import System.IO 

import qualified Syntax.TypesAMPL as S 
--import qualified Syntax.ErrM  as E
import Semantics.AMPL_am 

import MyParser.InterpretAMPL
import qualified MyParser.AMPLParserMeta as M


--import Language.LBNF.Runtime
import Language.LBNF.Compiletime

import Text.PrettyPrint

--type ParseFun = [Token] -> E.Err  S.AMPLCODE


main = do  
   args <- getArgs
   let fileName = args !! 0  
   contents <- readFile fileName  
   let tokens = M.myLexer contents
   let conctree = M.pAMPLCODE tokens
   case conctree of
      Bad msg   -> putStrLn msg
      Ok  tree  -> do
              putStrLn (show tree)
              --ans <- run_cm' compiled
              --putStrLn (show (ans::S.MACH))
               --   where compiled = (compile_all tree)

