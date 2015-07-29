module ASTGenerator where

import AMPLParserMeta
--import Language.LBNF.Runtime
import Language.LBNF.Compiletime

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
  Constructors structor_specs  -> map transSTRUCTOR_SPEC structor_specs
  Constructors_none  ->  []


--transDESTRUCTORS :: DESTRUCTORS -> Result
transDESTRUCTORS x = case x of
  Destructors structor_specs  -> map (transSTRUCTOR_SPEC) structor_specs
  Destructors_none  -> []


--transSTRUCTOR_SPEC :: STRUCTOR_SPEC -> Result
transSTRUCTOR_SPEC x = case x of
  Struct_spec uident structs  -> (transUIdent uident,map (transSTRUCT) structs)


--transSTRUCT :: STRUCT -> Result
transSTRUCT x = case x of
  Struct uident n  -> (transUIdent uident , (n::Integer))


--transHANDLES :: HANDLES -> Result
transHANDLES x = case x of
  Handles handle_specs  -> map (transHANDLE_SPEC) handle_specs
  Handles_none  -> []


--transCOHANDLES :: COHANDLES -> Result
transCOHANDLES x = case x of
  Cohandles handle_specs  -> map (transHANDLE_SPEC) handle_specs
  Cohandles_none  -> []


--transPROCESSES :: PROCESSES -> Result
transPROCESSES x = case x of
  Processes process_specs  -> map (transPROCESS_SPEC) process_specs 
  Processes_none  -> []


--transPROCESS_SPEC :: PROCESS_SPEC -> Result
transPROCESS_SPEC x = case x of
  Process_spec uident varss ids1 ids2 coms3  ->
    ((transUIdent uident),(map transVars varss),(map transIdent ids1),(map transIdent ids2),(transCOMS coms3))




--transVars :: Vars -> Result
transVars x = case x of
  VName id  -> transIdent id 


--transFUNCTIONS :: FUNCTIONS -> Result
transFUNCTIONS x = case x of
  Functions function_specs  -> map (transFUNCTION_SPEC) function_specs
  Functions_none  -> []


--transFUNCTION_SPEC :: FUNCTION_SPEC -> Result
transFUNCTION_SPEC x = case x of
  Function_spec uident varss coms  -> 
     ((transUIdent uident),(map transVars varss), (transCOMS coms))


--transSTART :: START -> Result
transSTART x = case x of
  Start channel_spec coms  -> ((transCHANNEL_SPEC channel_spec),(transCOMS coms))


--transCHANNEL_SPEC :: CHANNEL_SPEC -> Result
transCHANNEL_SPEC x = case x of
  Channel_specf ids1 ids2  -> ((map transIdent ids1),(map transIdent ids1))
  --Channel_spec cintegers1 cintegers2  -> failure x


--transCOMS :: COMS -> Result
transCOMS x = case x of
  Prog coms  -> map transCOM coms


--transCOM :: COM -> Result
transCOM x = case x of
  AC_STORE  -> T.AC_STORE
  AC_STOREf id  -> (T.AC_STORE)
  AC_LOAD n  -> T.AC_LOAD (fromIntegral n) 
  AC_LOADf id  -> T.AC_LOADf (transIdent id)
  AC_RET  -> T.AC_RET
  AC_FRET  -> T.AC_FRET
  --AC_CALL id  -> T.AC_CALL (transIdent id)
  AC_CALLf id ids  -> T.AC_CALLf (transIdent id) (map transIdent ids)
  AC_INT cinteger  -> T.AC_INT (transCInteger cinteger)
  AC_LEQ  -> T.AC_LEQ
  AC_ADD  -> T.AC_ADD
  AC_MUL  -> T.AC_MUL
  AC_CONCAT  -> T.AC_CONCAT
  AC_REVERSE  -> T.AC_REVERSE
  AC_CONS n1 n2  -> T.AC_CONS  (fromIntegral n1) (fromIntegral n2)
 -- AC_STRUCT uident1 uident2  -> T.AC_STRUCT (transUIdent uident1) (transUIdent uident2)
  {- AC_STRUCTas uident1 uident2 ids3  -> T.AC_STRUCTas (transUIdent uident1)
                                                     (transUIdent uident2)
                                                     (map transIdent ids3)
                                                     -}
  AC_CASE comss  -> T.AC_CASE (map transCOMS comss)
  AC_CASEf labelcomss  -> T.AC_CASEf (map transLABELCOMS labelcomss)
  AC_RECORD comss  -> T.AC_RECORD (map transCOMS comss)
  AC_RECORDf labelcomss  -> T.AC_RECORDf (map transLABELCOMS labelcomss)
  AC_DEST n1 n2  -> T.AC_DEST (fromIntegral n1) (fromIntegral n2) 
  AC_GET cinteger  -> T.AC_GET (transCInteger cinteger)
  AC_GETf id  -> T.AC_GETf (transIdent id)
  AC_HPUT cinteger n  -> T.AC_HPUT (transCInteger cinteger) (fromIntegral n) 
  AC_HPUTf id uident1 uident2  -> T.AC_HPUTf (transIdent id) 
                                             ((transUIdent uident1),
                                              (transUIdent uident2))
  AC_HCASE cinteger comss  -> T.AC_HCASE (transCInteger cinteger)
                                         (map transCOMS comss)
  --AC_HCASEf id labelcomss  -> T.AC_HCASEf (transIdent id)
  --                                        (map transLABELCOMS labelcomss)
  AC_PUT cinteger  -> T.AC_PUT (transCInteger cinteger)
  AC_PUTf id  -> T.AC_PUTf (transIdent id)
  AC_SPLIT cinteger1 cinteger2 cinteger3  -> T.AC_SPLIT
                                                   (transCInteger cinteger1)
                                                   ((transCInteger cinteger2),
                                                    (transCInteger cinteger3))

  AC_SPLITf id1 id2 id3  -> T.AC_SPLITf (transIdent id1)
                                        ((transIdent id2),
                                         (transIdent id3)) 
  --AC_FORK cinteger1 cinteger2 cintegers3 coms4 cinteger5 cintegers6 coms7  -> failure x
  --AC_FORKf id1 id2 ids3 coms4 id5 ids6 coms7  -> failure x
  {-AC_PLUG ncintegers cintegers1 coms2 cintegers3 coms4  -> T.AC_PLUG 
                                                                 (map transNCInteger ncintegers)
                                                                 ((map transCInteger  cintegers1)
                                                                 ,(    transCOMS coms2))
                                                                 ((map transCInteger cintegers3)
                                                                 (    transCOMS coms4))
  --AC_PLUGf nidents ids1 coms2 ids3 coms4  -> failure x -}
  --AC_RUN trans uident  -> T.AC_RUN  (map transTRAN trans) (transUIdent uident) 
  AC_RUNf uident ids1 ids2 ids3  -> T.AC_RUNf
                                        (transUIdent uident)
                                        (map transIdent ids1)
                                        ((map transIdent ids2),
                                         (map transIdent ids3))

  AC_CLOSE cinteger  -> T.AC_CLOSE $ transCInteger cinteger
  AC_CLOSEf id  ->  T.AC_CLOSEf $ transIdent id 
  AC_HALT cinteger  -> T.AC_HALT $ transCInteger cinteger
  AC_HALTf id  -> T.AC_HALTf $ transIdent id 


--transLABELCOMS :: LABELCOMS -> Result
transLABELCOMS x = case x of
  Labelcoms uident1 uident2 coms3  -> ((transUIdent uident1),
                                       (transUIdent uident2),
                                       (transCOMS coms3))


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
  Positive n  -> (fromIntegral n) 
  Negative n  -> negate(fromIntegral n)


{-
 data COM =
   AC_STORE
 | AC_STOREf VAR
 | AC_LOAD Int
 | AC_LOADf VAR
 | AC_RET
 | AC_FRET
 | AC_CALL String Int
 | AC_CALLf String VARS
 | AC_INT Int
 | AC_STRING String -- experimental
 | AC_LEQ
 | AC_ADD
 | AC_MUL
 | AC_CONS Int Int
 | AC_STRUCT STRUCTOR_NAME [String]
 | AC_CASE [COMS]
 | AC_CASEf [(STRUCTOR_NAME,[String],COMS)]
 | AC_RECORD [COMS]
 | AC_RECORDf [(STRUCTOR_NAME,[String],COMS)]
 | AC_DEST Int Int
 | AC_GET Int 
 | AC_GETf String
 | AC_HPUT Int Int
 | AC_HPUTf String STRUCTOR_NAME
 | AC_PUT Int
 | AC_PUTf String
 | AC_SPLIT Int (Int,Int)
 | AC_SPLITf CHANNEL (CHANNEL,CHANNEL)
 | AC_FORK Int ((Int,[Int],COMS),(Int,[Int],COMS))
 | AC_FORKf CHANNEL ((CHANNEL,CHANNELS,COMS),(CHANNEL,CHANNELS,COMS))
 | AC_PLUG [(Int,POLARITY,POLARITY)] ([Int],COMS) ([Int],COMS)
 | AC_PLUGf CHANNEL (CHANNELS,COMS) (CHANNELS,COMS)
 | AC_CLOSE Int
 | AC_CLOSEf CHANNEL
 | AC_HALT Int
 | AC_HALTf CHANNEL
 | AC_HCASE Int [COMS]
 | AC_HCASEf CHANNEL [(STRUCTOR_NAME,[COM])]
 | AC_RUN [(Int,POLARITY,Int)] String Int
 | AC_RUNf String VARS (CHANNELS,CHANNELS)
 | AC_CONCAT
 | AC_REVERSE
  deriving (Eq,Ord,Show,Read) 
-}

