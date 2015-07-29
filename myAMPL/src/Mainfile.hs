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
              putStrLn (show compiled)
              --ans <- run_cm' compiled
              --putStrLn (show (ans::S.MACH))
                  where compiled = (compile_all tree)

{-
 Main (Handles [Hand_spec (UIdent "StrTerm") [HandName (UIdent "Get"),HandName (UIdent "Put"),
 HandName (UIdent "Close")]]) (Cohandles [Hand_spec (UIdent "Console")
 [HandName (UIdent "Get"),HandName (UIdent "Put"),HandName (UIdent "Close")]])
  Constructors_none Destructors_none Processes_none Functions_none (Start (Channel_specf [Ident "console"]
   [Ident "strTerm1"]) (Prog [AC_HPUTf (Ident "strTerm1") (UIdent "StrTerm") (UIdent "Get"),
   AC_GETf (Ident "strTerm1"),AC_STOREf (Ident "x"),AC_HPUTf (Ident "strTerm1") (UIdent "StrTerm") (UIdent "Get")
   ,AC_GETf (Ident "strTerm1"),AC_STOREf (Ident "y"),AC_LOADf (Ident "y"),AC_LOADf (Ident "x"),AC_CONCAT,
   AC_HPUTf (Ident "strTerm1") (UIdent "StrTerm") (UIdent "Put"),AC_PUTf (Ident "strTerm1"),
   AC_HPUTf (Ident "strTerm1") (UIdent "StrTerm") (UIdent "Put"),AC_PUTf (Ident "strTerm1"),
   AC_HPUTf (Ident "strTerm1") (UIdent "StrTerm") (UIdent "Close"),AC_CLOSEf (Ident "strTerm1"),
   AC_HPUTf (Ident "console") (UIdent "Console") (UIdent "Close"),AC_HALTf (Ident "console")]))   
-}