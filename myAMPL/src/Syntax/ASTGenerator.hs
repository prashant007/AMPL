module ASTGenerator where

import AMPLParserMeta
import Language.LBNF.Runtime
import qualified TypesAMPL as T 


failure x = Bad $ "Undefined case: " ++ show x

--transIdent :: Ident -> Result
transIdent x = case x of
  Ident str  -> str 


--transUIdent :: UIdent -> Result
transUIdent x = case x of
  UIdent str  -> str 


--transAMPLCODE :: AMPLCODE -> Result
transAMPLCODE x = case x of
  Main handles cohandles constructors destructors processes functions start  -> 
        let
          handles1      = transHANDLES handles
          cohandles1    = transCOHANDLES cohandles 
          constructors1 = transCONSTRUCTORS constructors
          destructors1  = transDESTRUCTORS destructors
          processes1    = transPROCESSES processes
          functions1    = transFUNCTIONS functions
          start1        = transSTART start
        in 
          (handles1,cohandles1,constructors1,destructors1,processes1,functions1,start1)



--transHANDLE_SPEC :: HANDLE_SPEC -> Result
transHANDLE_SPEC x = case x of
  Hand_spec uident handles  -> (transUIdent uident,map transHandle handles)


--transHandle :: Handle -> Result
transHandle x = case x of
  HandName uident  -> transUIdent uident


--transCONSTRUCTORS :: CONSTRUCTORS -> Result
transCONSTRUCTORS x = case x of
  Constructors structor_specs  -> failure x
  Constructors_none  ->  failure x 


--transDESTRUCTORS :: DESTRUCTORS -> Result
transDESTRUCTORS x = case x of
  Destructors structor_specs  -> failure x
  Destructors_none  -> failure x


--transSTRUCTOR_SPEC :: STRUCTOR_SPEC -> Result
transSTRUCTOR_SPEC x = case x of
  Struct_spec uident structs  -> failure x


--transSTRUCT :: STRUCT -> Result
transSTRUCT x = case x of
  Struct uident n  -> (transUIdent uident , (n::Integer))


--transHANDLES :: HANDLES -> Result
transHANDLES x = case x of
  Handles handle_specs  -> failure x
  Handles_none  -> failure x


--transCOHANDLES :: COHANDLES -> Result
transCOHANDLES x = case x of
  Cohandles handle_specs  -> failure x
  Cohandles_none  -> failure x


--transPROCESSES :: PROCESSES -> Result
transPROCESSES x = case x of
  Processes process_specs  -> failure x
  Processes_none  -> failure x


--transPROCESS_SPEC :: PROCESS_SPEC -> Result
transPROCESS_SPEC x = case x of
  Process_spec uident varss ids1 ids2 coms3  -> failure x


--transVars :: Vars -> Result
transVars x = case x of
  VName id  -> failure x


--transFUNCTIONS :: FUNCTIONS -> Result
transFUNCTIONS x = case x of
  Functions function_specs  -> failure x
  Functions_none  -> failure x


--transFUNCTION_SPEC :: FUNCTION_SPEC -> Result
transFUNCTION_SPEC x = case x of
  Function_spec uident varss coms  -> failure x


--transSTART :: START -> Result
transSTART x = case x of
  Start channel_spec coms  -> failure x


--transCHANNEL_SPEC :: CHANNEL_SPEC -> Result
transCHANNEL_SPEC x = case x of
  Channel_specf ids1 ids2  -> failure x
  Channel_spec cintegers1 cintegers2  -> failure x


--transCOMS :: COMS -> Result
transCOMS x = case x of
  Prog coms  -> map transCOM coms


--transCOM :: COM -> Result
transCOM x = case x of
  AC_STORE  -> T.AMC_STORE
  AC_STOREf id  -> (T.AMC_STORE)
  AC_LOAD n  -> failure x
  AC_LOADf id  -> failure x
  AC_RET  -> failure x
  AC_FRET  -> failure x
  AC_CALL id  -> failure x
  AC_CALLf id ids  -> failure x
  AC_INT cinteger  -> failure x
  AC_LEQ  -> failure x
  AC_ADD  -> failure x
  AC_MUL  -> failure x
  AC_CONCAT  -> T.AMC_CONCAT
  AC_REVERSE  -> T.AMC_REVERSE
  AC_CONS n1 n2  -> T.AMC_CONS n1 n2
  AC_STRUCT uident1 uident2  -> failure x
  AC_STRUCTas uident1 uident2 ids3  -> failure x
  AC_CASE comss  -> failure x
  AC_CASEf labelcomss  -> failure x
  AC_RECORD comss  -> failure x
  AC_RECORDf labelcomss  -> failure x
  AC_DEST n1 n2  -> failure x
  AC_GET cinteger  -> failure x
  AC_GETf id  -> failure x
  AC_HPUT cinteger n  -> failure x
  AC_HPUTf id uident1 uident2  -> failure x
  AC_HCASE cinteger comss  -> failure x
  AC_HCASEf id labelcomss  -> failure x
  AC_PUT cinteger  -> failure x
  AC_PUTf id  -> failure x
  AC_SPLIT cinteger1 cinteger2 cinteger3  -> failure x
  AC_SPLITf id1 id2 id3  -> failure x
  AC_FORK cinteger1 cinteger2 cintegers3 coms4 cinteger5 cintegers6 coms7  -> failure x
  AC_FORKf id1 id2 ids3 coms4 id5 ids6 coms7  -> failure x
  AC_PLUG ncintegers cintegers1 coms2 cintegers3 coms4  -> T.AMC_PLUG 
                                                                 (map transNCInteger ncintegers)
                                                                 ((map transCInteger  cintegers1)
                                                                 ,(    transCOMS coms2))
                                                                 ((map transCInteger cintegers3)
                                                                 (    transCOMS coms4))
  --AC_PLUGf nidents ids1 coms2 ids3 coms4  -> failure x
  AC_RUN trans uident  -> T.AMC_RUN  (map transTRAN trans) (transUIdent uident) 
  --AC_RUNf uident ids1 ids2 ids3  -> failure x
  AC_CLOSE cinteger  -> T.AMC_CLOSE $ transCInteger cinteger
  --AC_CLOSEf id  -> failure x
  AC_HALT cinteger  -> T.AMC_HALT $ transCInteger cinteger
  --AC_HALTf id  -> T.AMC_HALT $ transIdent id 


--transLABELCOMS :: LABELCOMS -> Result
transLABELCOMS x = case x of
  Labelcoms uident1 uident2 coms3  -> failure x


--transTRAN :: TRAN -> Result
transTRAN x = case x of
  TranIn1 n1 n2  -> ((n1::T.CH),(T.IN::T.POLARITY),(n2::T.CH))
  TranIn2 n1 n2  -> ((n1::T.CH),(T.OUT::T.POLARITY),(n2::T.CH))


--transNCInteger :: NCInteger -> Result
transNCInteger x = case x of
  Ncinteger cinteger  -> transCInteger cinteger


--transNIdent :: NIdent -> Result
transNIdent x = case x of
  Nident id  -> transIdent id 


--transCInteger :: CInteger -> Result
transCInteger x = case x of
  Positive n  -> (n::Integer) 
  Negative n  -> (n::Integer)




