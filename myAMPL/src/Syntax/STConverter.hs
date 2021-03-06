module Syntax.STConverter where
import qualified Syntax.TypesAMPL as T
import Language.LBNF.Compiletime
import Language.LBNF.Runtime
import MyParser.AMPLParserMeta
import MyParser.InterpretAMPL
import Semantics.AMPL_am


myLLexer = resolveLayout True . myLexer


transIdent x = case x of
  Ident str  -> str 


transUIdent x = case x of
  UIdent str  -> str 


transAMPLCODE x = case x of
  Main handles cohandles constructors destructors processes functions start  -> T.AMPLcode 
                                                                                  (transHANDLES handles)
                                                                                  (transCOHANDLES cohandles)
                                                                                  (transCONSTRUCTORS constructors)
                                                                                  (transDESTRUCTORS destructors)
                                                                                  (transPROCESSES processes)
                                                                                  (transFUNCTIONS functions)
                                                                                  (transSTART start)

transHANDLE_SPEC x = case x of
  Hand_spec uident handles  -> T.Handle_spec(transUIdent uident) (map transHandle handles)

transHandle x = case x of
  HandName uident  -> (transUIdent uident)


transCONSTRUCTORS x = case x of
  Constructors structor_specs  -> map transSTRUCTOR_SPEC structor_specs
  Constructors_none  -> []


transDESTRUCTORS x = case x of
  Destructors structor_specs  -> map transSTRUCTOR_SPEC structor_specs
  Destructors_none  -> []


transSTRUCTOR_SPEC x = case x of
  Struct_spec uident structs  -> T.Struct_spec (transUIdent uident) (map transSTRUCT structs)


transSTRUCT x = case x of
  Struct uident n  -> (transUIdent uident , fromIntegral n)

transHANDLES x = case x of
  Handles handle_specs  -> map transHANDLE_SPEC handle_specs
  Handles_none          -> []


transCOHANDLES x = case x of
  Cohandles handle_specs  -> map transHANDLE_SPEC handle_specs
  Cohandles_none          -> []


transPROCESSES x = case x of
  Processes process_specs  -> map transPROCESS_SPEC   process_specs
  Processes_none  -> []


transPROCESS_SPEC x = case x of
  Process_spec ident varss ids1 ids2 coms3  -> T.Process_specf (transIdent ident) (map transVars varss) ((map transIdent ids1),
                                                 (map transIdent ids2)) (transCOMS coms3)

transVars x = case x of
  VName id  -> (transIdent id)


transFUNCTIONS x = case x of
  Functions function_specs  -> map transFUNCTION_SPEC function_specs
  Functions_none  -> []


transFUNCTION_SPEC x = case x of
  Function_spec ident varss coms  -> T.Function_specf (transIdent ident) (map transVars varss) (transCOMS coms)


transSTART x = case x of
  Start channel_spec coms  -> ((transCHANNEL_SPEC channel_spec),(transCOMS coms))



transCHANNEL_SPEC x = case x of
  Channel_specf ids1 ids2  -> T.Channel_specf (map transIdent ids1) (map transIdent ids2)
  Channel_spec cintegers1 cintegers2  -> T.Channel_spec (map transCInteger cintegers1) (map transCInteger cintegers1)


transCOMS x = case x of
  Prog coms  -> (map transCOM coms)



transCOM x = case x of
  AC_STOREf id  -> T.AC_STOREf (transIdent id)
  AC_LOADf id  -> T.AC_LOADf (transIdent id)
  AC_FRET  -> T.AC_FRET
  AC_RET  -> T.AC_RET
  AC_CALLf id ids  -> T.AC_CALLf (transIdent id) (map transIdent ids)
  AC_INT cinteger  -> T.AC_INT $ transCInteger cinteger
  AC_LEQ   -> T.AC_LEQ
  AC_ADD   -> T.AC_ADD
  AC_DIV_Q -> T.AC_DIV_Q
  AC_DIV_R -> T.AC_DIV_R 
  AC_MUL  -> T.AC_MUL
  AC_CONS n1 n2  -> T.AC_CONS (fromIntegral n1) (fromIntegral n2)
  AC_STRUCT uident1 uident2  -> T.AC_STRUCT ((transUIdent uident1) ,(transUIdent uident2)) []
  AC_STRUCTas uident1 uident2 idents -> T.AC_STRUCT ((transUIdent uident1) ,(transUIdent uident2)) (map transIdent idents)
  AC_CASEf labelcomss  -> T.AC_CASEf (map transLABELCOMS labelcomss)
  AC_RECORDf labelcomss  -> T.AC_RECORDf (map transLABELCOMS labelcomss)
  AC_DEST n1 n2  -> T.AC_DEST (fromIntegral n1) (fromIntegral n2)
  AC_GETf id  -> T.AC_GETf (transIdent id)
  AC_HPUTf id uident1 uident2  -> T.AC_HPUTf (transIdent id) (transUIdent uident1 , transUIdent uident2)
  AC_HCASEf id labelcomss  -> T.AC_HCASEf (transIdent id) double_list
                                where triple_list = map transLABELCOMS labelcomss
                                      double_list = map (\(x,y,z) -> (x,z)) triple_list
  AC_PUTf id  -> T.AC_PUTf (transIdent id)
  AC_SPLITf id1 id2 id3  -> T.AC_SPLITf (transIdent id1) ((transIdent id2),(transIdent id3))
  AC_FORKf id1 id2 ids3 coms4 id5 ids6 coms7  -> T.AC_FORKf (transIdent id1) (c1,c2)
                                                    where c1 = (transIdent id2,(map transIdent ids3),transCOMS coms4)
                                                          c2 = (transIdent id5,(map transIdent ids6),transCOMS coms7)
  AC_PLUGf ident ids1 coms2 ids3 coms4  -> T.AC_PLUGf (transIdent ident)
                                                        ((map transIdent ids1),(transCOMS coms2))
                                                        ((map transIdent ids3),(transCOMS coms4))
  AC_RUNf ident ids1 ids2 ids3  -> T.AC_RUNf (transIdent ident)
                                              (map transIdent ids1)
                                              ((map transIdent ids2),(map transIdent ids3)) 
  AC_CLOSEf id  -> T.AC_CLOSEf (transIdent id)
  AC_HALTf id  -> T.AC_HALTf (transIdent id)
  AC_IDF id1 id2 -> T.AC_IDf (transIdent id1) (transIdent id2)
  




transLABELCOMS x = case x of
  Labelcoms1 uident1 uident2 coms3  -> (((transUIdent uident1),(transUIdent uident2)),[],(transCOMS coms3))
  Labelcoms2 uident1 uident2 idents coms3  -> (((transUIdent uident1),(transUIdent uident2)),
                                               (map transIdent idents),(transCOMS coms3))

transTRAN x = case x of
  TranIn11 n1 n2  -> ((fromIntegral n1),T.IN ,(fromIntegral n2))
  TranIn12 n1 n2  -> ((fromIntegral n1),T.OUT,(fromIntegral n2))


transNCInteger x = case x of
  Ncinteger cinteger  -> transCInteger cinteger


transNIdent x = case x of
  Nident1 id  -> transIdent id 


transCInteger x = case x of
  Positive n  -> (fromIntegral n)
  Negative n  -> (fromIntegral n)


                    

