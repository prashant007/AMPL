module Skelparser where

-- Haskell module generated by the BNF converter

import Absparser
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transIdent :: Ident -> Result
transIdent x = case x of
  Ident str  -> failure x


transUIdent :: UIdent -> Result
transUIdent x = case x of
  UIdent str  -> failure x


transAMPLCODE :: AMPLCODE -> Result
transAMPLCODE x = case x of
  Main handles cohandles constructors destructors processes functions start  -> failure x


transHANDLE_SPEC :: HANDLE_SPEC -> Result
transHANDLE_SPEC x = case x of
  Hand_spec uident handles  -> failure x


transHandle :: Handle -> Result
transHandle x = case x of
  HandName uident  -> failure x


transCONSTRUCTORS :: CONSTRUCTORS -> Result
transCONSTRUCTORS x = case x of
  Constructors structor_specs  -> failure x
  Constructors_none  -> failure x


transDESTRUCTORS :: DESTRUCTORS -> Result
transDESTRUCTORS x = case x of
  Destructors structor_specs  -> failure x
  Destructors_none  -> failure x


transSTRUCTOR_SPEC :: STRUCTOR_SPEC -> Result
transSTRUCTOR_SPEC x = case x of
  Struct_spec uident structs  -> failure x


transSTRUCT :: STRUCT -> Result
transSTRUCT x = case x of
  Struct uident n  -> failure x


transHANDLES :: HANDLES -> Result
transHANDLES x = case x of
  Handles handle_specs  -> failure x
  Handles_none  -> failure x


transCOHANDLES :: COHANDLES -> Result
transCOHANDLES x = case x of
  Cohandles handle_specs  -> failure x
  Cohandles_none  -> failure x


transPROCESSES :: PROCESSES -> Result
transPROCESSES x = case x of
  Processes process_specs  -> failure x
  Processes_none  -> failure x


transPROCESS_SPEC :: PROCESS_SPEC -> Result
transPROCESS_SPEC x = case x of
  Process_spec id varss ids1 ids2 coms3  -> failure x


transVars :: Vars -> Result
transVars x = case x of
  VName id  -> failure x


transFUNCTIONS :: FUNCTIONS -> Result
transFUNCTIONS x = case x of
  Functions function_specs  -> failure x
  Functions_none  -> failure x


transFUNCTION_SPEC :: FUNCTION_SPEC -> Result
transFUNCTION_SPEC x = case x of
  Function_spec id varss coms  -> failure x


transSTART :: START -> Result
transSTART x = case x of
  Start channel_spec coms  -> failure x


transCHANNEL_SPEC :: CHANNEL_SPEC -> Result
transCHANNEL_SPEC x = case x of
  Channel_specf ids1 ids2  -> failure x
  Channel_spec cintegers1 cintegers2  -> failure x


transCOMS :: COMS -> Result
transCOMS x = case x of
  Prog coms  -> failure x


transCOM :: COM -> Result
transCOM x = case x of
  AC_STOREf id  -> failure x
  AC_LOADf id  -> failure x
  AC_RET  -> failure x
  AC_FRET  -> failure x
  AC_CALLf id ids  -> failure x
  AC_INT cinteger  -> failure x
  AC_LEQ  -> failure x
  AC_ADD  -> failure x
  AC_MUL  -> failure x
  AC_CONS n1 n2  -> failure x
  AC_STRUCT uident1 uident2  -> failure x
  AC_STRUCTas uident1 uident2 ids3  -> failure x
  AC_CASEf labelcomss  -> failure x
  AC_RECORDf labelcomss  -> failure x
  AC_DEST n1 n2  -> failure x
  AC_GETf id  -> failure x
  AC_HPUTf id uident1 uident2  -> failure x
  AC_HCASEf id labelcomss  -> failure x
  AC_PUTf id  -> failure x
  AC_SPLITf id1 id2 id3  -> failure x
  AC_FORKf id1 id2 ids3 coms4 id5 ids6 coms7  -> failure x
  AC_PLUGf id ids1 coms2 ids3 coms4  -> failure x
  AC_RUNf id ids1 ids2 ids3  -> failure x
  AC_IDF id1 id2  -> failure x
  AC_CLOSEf id  -> failure x
  AC_HALTf id  -> failure x


transLABELCOMS :: LABELCOMS -> Result
transLABELCOMS x = case x of
  Labelcoms1 uident1 uident2 coms3  -> failure x
  Labelcoms2 uident1 uident2 ids3 coms4  -> failure x


transTRAN :: TRAN -> Result
transTRAN x = case x of
  TranIn11 n1 n2  -> failure x
  TranIn12 n1 n2  -> failure x


transNCInteger :: NCInteger -> Result
transNCInteger x = case x of
  Ncinteger cinteger  -> failure x


transNIdent :: NIdent -> Result
transNIdent x = case x of
  Nident1 id  -> failure x


transCInteger :: CInteger -> Result
transCInteger x = case x of
  Positive n  -> failure x
  Negative n  -> failure x


