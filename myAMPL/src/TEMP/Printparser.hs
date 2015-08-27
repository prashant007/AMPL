{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}
module Printparser where

-- pretty-printer generated by the BNF converter

import Absparser
import Data.Char


-- the top-level printing method
printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 (map ($ "") $ d []) "" where
  rend i ss = case ss of
    "["      :ts -> showChar '[' . rend i ts
    "("      :ts -> showChar '(' . rend i ts
    "{"      :ts -> showChar '{' . new (i+1) . rend (i+1) ts
    "}" : ";":ts -> new (i-1) . space "}" . showChar ';' . new (i-1) . rend (i-1) ts
    "}"      :ts -> new (i-1) . showChar '}' . new (i-1) . rend (i-1) ts
    ";"      :ts -> showChar ';' . new i . rend i ts
    t  : "," :ts -> showString t . space "," . rend i ts
    t  : ")" :ts -> showString t . showChar ')' . rend i ts
    t  : "]" :ts -> showString t . showChar ']' . rend i ts
    t        :ts -> space t . rend i ts
    _            -> id
  new i   = showChar '\n' . replicateS (2*i) (showChar ' ') . dropWhile isSpace
  space t = showString t . (\s -> if null s then "" else (' ':s))

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- the printer class does the job
class Print a where
  prt :: Int -> a -> Doc
  prtList :: [a] -> Doc
  prtList = concatD . map (prt 0)

instance Print a => Print [a] where
  prt _ = prtList

instance Print Char where
  prt _ s = doc (showChar '\'' . mkEsc '\'' s . showChar '\'')
  prtList s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q s = case s of
  _ | s == q -> showChar '\\' . showChar s
  '\\'-> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  _ -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j<i then parenth else id


instance Print Integer where
  prt _ x = doc (shows x)


instance Print Double where
  prt _ x = doc (shows x)


instance Print Ident where
  prt _ (Ident i) = doc (showString ( i))
  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ",") , prt 0 xs])


instance Print UIdent where
  prt _ (UIdent i) = doc (showString ( i))



instance Print AMPLCODE where
  prt i e = case e of
   Main handles cohandles constructors destructors processes functions start -> prPrec i 0 (concatD [prt 0 handles , prt 0 cohandles , prt 0 constructors , prt 0 destructors , prt 0 processes , prt 0 functions , prt 0 start])


instance Print HANDLE_SPEC where
  prt i e = case e of
   Hand_spec uident handles -> prPrec i 0 (concatD [prt 0 uident , doc (showString "=") , doc (showString "{") , prt 0 handles , doc (showString "}")])

  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ";") , prt 0 xs])

instance Print Handle where
  prt i e = case e of
   HandName uident -> prPrec i 0 (concatD [prt 0 uident])

  prtList es = case es of
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ";") , prt 0 xs])

instance Print CONSTRUCTORS where
  prt i e = case e of
   Constructors structor_specs -> prPrec i 0 (concatD [doc (showString "%constructors") , doc (showString ":") , doc (showString "{") , prt 0 structor_specs , doc (showString "}")])
   Constructors_none  -> prPrec i 0 (concatD [])


instance Print DESTRUCTORS where
  prt i e = case e of
   Destructors structor_specs -> prPrec i 0 (concatD [doc (showString "%destructors") , doc (showString ":") , doc (showString "{") , prt 0 structor_specs , doc (showString "}")])
   Destructors_none  -> prPrec i 0 (concatD [])


instance Print STRUCTOR_SPEC where
  prt i e = case e of
   Struct_spec uident structs -> prPrec i 0 (concatD [prt 0 uident , doc (showString "=") , doc (showString "{") , prt 0 structs , doc (showString "}")])

  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ";") , prt 0 xs])

instance Print STRUCT where
  prt i e = case e of
   Struct uident n -> prPrec i 0 (concatD [prt 0 uident , prt 0 n])

  prtList es = case es of
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ";") , prt 0 xs])

instance Print HANDLES where
  prt i e = case e of
   Handles handle_specs -> prPrec i 0 (concatD [doc (showString "%handles") , doc (showString ":") , doc (showString "{") , prt 0 handle_specs , doc (showString "}")])
   Handles_none  -> prPrec i 0 (concatD [])


instance Print COHANDLES where
  prt i e = case e of
   Cohandles handle_specs -> prPrec i 0 (concatD [doc (showString "%cohandles") , doc (showString ":") , doc (showString "{") , prt 0 handle_specs , doc (showString "}")])
   Cohandles_none  -> prPrec i 0 (concatD [])


instance Print PROCESSES where
  prt i e = case e of
   Processes process_specs -> prPrec i 0 (concatD [doc (showString "%processes") , doc (showString ":") , doc (showString "{") , prt 0 process_specs , doc (showString "}")])
   Processes_none  -> prPrec i 0 (concatD [])


instance Print PROCESS_SPEC where
  prt i e = case e of
   Process_spec id varss ids0 ids coms -> prPrec i 0 (concatD [prt 0 id , doc (showString "(") , prt 0 varss , doc (showString "|") , prt 0 ids0 , doc (showString "=>") , prt 0 ids , doc (showString ")") , doc (showString "=") , prt 0 coms])

  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ";") , prt 0 xs])

instance Print Vars where
  prt i e = case e of
   VName id -> prPrec i 0 (concatD [prt 0 id])

  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ",") , prt 0 xs])

instance Print FUNCTIONS where
  prt i e = case e of
   Functions function_specs -> prPrec i 0 (concatD [doc (showString "%functions") , doc (showString ":") , doc (showString "{") , prt 0 function_specs , doc (showString "}")])
   Functions_none  -> prPrec i 0 (concatD [])


instance Print FUNCTION_SPEC where
  prt i e = case e of
   Function_spec id varss coms -> prPrec i 0 (concatD [prt 0 id , doc (showString "(") , prt 0 varss , doc (showString ")") , doc (showString "=") , prt 0 coms])

  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ";") , prt 0 xs])

instance Print START where
  prt i e = case e of
   Start channel_spec coms -> prPrec i 0 (concatD [doc (showString "%run") , prt 0 channel_spec , doc (showString ":") , prt 0 coms])


instance Print CHANNEL_SPEC where
  prt i e = case e of
   Channel_specf ids0 ids -> prPrec i 0 (concatD [doc (showString "(") , doc (showString "|") , prt 0 ids0 , doc (showString "=>") , prt 0 ids , doc (showString ")")])
   Channel_spec cintegers0 cintegers -> prPrec i 0 (concatD [doc (showString "(") , prt 0 cintegers0 , doc (showString "=>") , prt 0 cintegers , doc (showString ")")])


instance Print COMS where
  prt i e = case e of
   Prog coms -> prPrec i 0 (concatD [doc (showString "{") , prt 0 coms , doc (showString "}")])

  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ",") , prt 0 xs])

instance Print COM where
  prt i e = case e of
   AC_STOREf id -> prPrec i 0 (concatD [doc (showString "store") , prt 0 id])
   AC_LOADf id -> prPrec i 0 (concatD [doc (showString "load") , prt 0 id])
   AC_RET  -> prPrec i 0 (concatD [doc (showString "ret")])
   AC_FRET  -> prPrec i 0 (concatD [doc (showString "fret")])
   AC_CALLf id ids -> prPrec i 0 (concatD [doc (showString "call") , prt 0 id , doc (showString "(") , prt 0 ids , doc (showString ")")])
   AC_INT cinteger -> prPrec i 0 (concatD [doc (showString "cInt") , prt 0 cinteger])
   AC_LEQ  -> prPrec i 0 (concatD [doc (showString "leq")])
   AC_ADD  -> prPrec i 0 (concatD [doc (showString "add")])
   AC_MUL  -> prPrec i 0 (concatD [doc (showString "mul")])
   AC_CONS n0 n -> prPrec i 0 (concatD [doc (showString "cons") , doc (showString "(") , prt 0 n0 , doc (showString ",") , prt 0 n , doc (showString ")")])
   AC_STRUCT uident0 uident -> prPrec i 0 (concatD [prt 0 uident0 , doc (showString ".") , prt 0 uident])
   AC_STRUCTas uident0 uident ids -> prPrec i 0 (concatD [prt 0 uident0 , doc (showString ".") , prt 0 uident , doc (showString "(") , prt 0 ids , doc (showString ")")])
   AC_CASEf labelcomss -> prPrec i 0 (concatD [doc (showString "case") , doc (showString "of") , doc (showString "{") , prt 0 labelcomss , doc (showString "}")])
   AC_RECORDf labelcomss -> prPrec i 0 (concatD [doc (showString "rec") , doc (showString "of") , doc (showString "{") , prt 0 labelcomss , doc (showString "}")])
   AC_DEST n0 n -> prPrec i 0 (concatD [doc (showString "dest") , prt 0 n0 , prt 0 n])
   AC_GETf id -> prPrec i 0 (concatD [doc (showString "get") , prt 0 id])
   AC_HPUTf id uident0 uident -> prPrec i 0 (concatD [doc (showString "hput") , prt 0 id , prt 0 uident0 , doc (showString ".") , prt 0 uident])
   AC_HCASEf id labelcomss -> prPrec i 0 (concatD [doc (showString "hcase") , prt 0 id , doc (showString "of") , doc (showString "{") , prt 0 labelcomss , doc (showString "}")])
   AC_PUTf id -> prPrec i 0 (concatD [doc (showString "put") , prt 0 id])
   AC_SPLITf id0 id1 id -> prPrec i 0 (concatD [doc (showString "split") , prt 0 id0 , doc (showString "into") , prt 0 id1 , prt 0 id])
   AC_FORKf id0 id1 ids2 coms3 id ids coms -> prPrec i 0 (concatD [doc (showString "fork") , prt 0 id0 , doc (showString "as") , doc (showString "{") , prt 0 id1 , doc (showString "with") , prt 0 ids2 , doc (showString "as") , prt 0 coms3 , doc (showString ";") , prt 0 id , doc (showString "with") , prt 0 ids , doc (showString "as") , prt 0 coms , doc (showString "}")])
   AC_PLUGf id ids0 coms1 ids coms -> prPrec i 0 (concatD [doc (showString "plug") , prt 0 id , doc (showString "with") , doc (showString "{") , doc (showString "[") , prt 0 ids0 , doc (showString "]") , doc (showString ":") , prt 0 coms1 , doc (showString ";") , doc (showString "[") , prt 0 ids , doc (showString "]") , doc (showString ":") , prt 0 coms , doc (showString "}")])
   AC_RUNf id ids0 ids1 ids -> prPrec i 0 (concatD [doc (showString "run") , prt 0 id , doc (showString "(") , prt 0 ids0 , doc (showString "|") , prt 0 ids1 , doc (showString "=>") , prt 0 ids , doc (showString ")")])
   AC_IDF id0 id -> prPrec i 0 (concatD [prt 0 id0 , doc (showString ":=") , prt 0 id])
   AC_CLOSEf id -> prPrec i 0 (concatD [doc (showString "close") , prt 0 id])
   AC_HALTf id -> prPrec i 0 (concatD [doc (showString "halt") , prt 0 id])

  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ";") , prt 0 xs])

instance Print LABELCOMS where
  prt i e = case e of
   Labelcoms1 uident0 uident coms -> prPrec i 0 (concatD [prt 0 uident0 , doc (showString ".") , prt 0 uident , doc (showString ":") , prt 0 coms])
   Labelcoms2 uident0 uident ids coms -> prPrec i 0 (concatD [prt 0 uident0 , doc (showString ".") , prt 0 uident , doc (showString "(") , prt 0 ids , doc (showString ")") , doc (showString ":") , prt 0 coms])

  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ";") , prt 0 xs])

instance Print TRAN where
  prt i e = case e of
   TranIn11 n0 n -> prPrec i 0 (concatD [doc (showString "(") , prt 0 n0 , doc (showString ",") , doc (showString "IN") , doc (showString ",") , prt 0 n , doc (showString ")")])
   TranIn12 n0 n -> prPrec i 0 (concatD [doc (showString "(") , prt 0 n0 , doc (showString ",") , doc (showString "OUT") , doc (showString ",") , prt 0 n , doc (showString ")")])

  prtList es = case es of
   [] -> (concatD [])
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ",") , prt 0 xs])
   x:xs -> (concatD [prt 0 x , doc (showString ";") , prt 0 xs])

instance Print NCInteger where
  prt i e = case e of
   Ncinteger cinteger -> prPrec i 0 (concatD [prt 0 cinteger])

  prtList es = case es of
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ",") , prt 0 xs])

instance Print NIdent where
  prt i e = case e of
   Nident1 id -> prPrec i 0 (concatD [prt 0 id])

  prtList es = case es of
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ",") , prt 0 xs])

instance Print CInteger where
  prt i e = case e of
   Positive n -> prPrec i 0 (concatD [prt 0 n])
   Negative n -> prPrec i 0 (concatD [doc (showString "-") , prt 0 n])

  prtList es = case es of
   [] -> (concatD [])
   [x] -> (concatD [prt 0 x])
   x:xs -> (concatD [prt 0 x , doc (showString ",") , prt 0 xs])

