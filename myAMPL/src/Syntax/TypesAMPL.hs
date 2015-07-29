{-# LANGUAGE DeriveGeneric #-}
module Syntax.TypesAMPL where


----------------------------------------------------------------------
----------------------------------------------------------------------
--   DATA for the AMPL machine 
----------------------------------------------------------------------
----------------------------------------------------------------------
--
--    The commands ... the only things allowed on the command stack C.
--
----------------------------------------------------------------------

data AMPLCOM = 
                                  -- concurrent comands
         AMC_GET CH
        |AMC_HPUT CH Int
        |AMC_HCASE CH [AMPLCOMS]
        |AMC_hcase [AMPLCOMS]
        |AMC_PUT CH
        |AMC_SPLIT CH (CH,CH)
        |AMC_FORK CH ((CH,[CH],AMPLCOMS),(CH,[CH],AMPLCOMS))
        |AMC_PLUG [CH] ([CH],AMPLCOMS)  ([CH],AMPLCOMS)
      	|AMC_CLOSE CH
        |AMC_HALT CH
        |AMC_RUN TRANS String Int

        |AMC_LOAD Int               -- access
        |AMC_CALL String Int
        |AMC_STORE 
        |AMC_RET
        |AMC_FRET
        |AMC_INT Int
        |AMC_LEQ
      	|AMC_ADD
        |AMC_MUL
        |AMC_CONS Int Int
        |AMC_CASE [AMPLCOMS] 
        |AMC_REC [AMPLCOMS]
        |AMC_STRING String
        |AMC_DEST Int Int
        |AMC_CONCAT
        |AMC_REVERSE 
        deriving (Eq,Ord,Show,Read)

----------------------------------------------------------------------
--
--    The values ... the only things on the stack.
--
----------------------------------------------------------------------

data VAL = V_CLO (AMPLCOMS,ENV) 
         | V_INT Int          -- currently the only built-in type
         | V_STRING String
         | V_CONS(Int,[VAL])
         | V_REC ([AMPLCOMS],ENV)
         | V_BOOL Bool
          deriving (Eq,Ord,Show,Read)

----------------------------------------------------------------------
--
--    The polarities ... 
--
----------------------------------------------------------------------


data POLARITY = IN|OUT
  deriving (Eq,Ord,Show,Read)

----------------------------------------------------------------------
-- The queues ..
-- Allows many values to be "put" on queues but forking and plitting 
-- result in the process being suspended and attached to the channel
----------------------------------------------------------------------
data QUEUE = Q_PUT VAL QUEUE
           | Q_HPUT Int QUEUE
           | Q_SPLIT (CH,CH)
           | Q_FORK  (TRANS,ENV,((CH,[CH],AMPLCOMS),(CH,[CH],AMPLCOMS)))
           | Q_GET SUSPENSION
           | Q_CLOSE
           | Q_HALT
           | Q_EMPTY
           | Q_HCASE [AMPLCOMS]
           deriving (Eq,Ord,Show,Read)


----------------------------------------------------------------------
--
-- The types for the channels for the channel manager 
--
----------------------------------------------------------------------


type CH = Int
type AMPLCHANNEL = (CH,QUEUE,QUEUE)   --  a channel (an identifier and an input and output queue)
type CHM = ([CH],[AMPLCHANNEL])       --  the channel manager (a list of used channel names and a list of channels)
type TRANS = [(CH,POLARITY,CH)]      --  the tanslation from local channel names to global names (and the polarity)
type ENV = [VAL]                   --  the environmemt
type STACK = [VAL]
type SUSPENSION = PROCESS          --  a suspended process
type MACH = (PROCESSES,CHM,DEFNS)
type MACH' = (PROCESSES,CHM)
type DEFN = (String,AMPLCOMS)      -- defined process or funcion
type DEFNS = [DEFN] 
type PROCESSES = [PROCESS]
type AMPLCOMS =  [AMPLCOM]
type PROCESS = (STACK,TRANS,ENV,AMPLCOMS)




----------------------------------------------------------------------
----------------------------------------------------------------------
-- Types for the AMPL assembler
----------------------------------------------------------------------
----------------------------------------------------------------------

newtype Ident = Ident String deriving (Eq,Ord,Show,Read)
newtype UIdent = UIdent String deriving (Eq,Ord,Show,Read)

type COMS = [COM]
type VAR = String
type VARS = [VAR]
type CHANNEL = String
type CHANNELS = [String]
type STRUCTOR_NAME = (String,String)

data AMPLCODE = AMPLcode [HANDLE_SPEC] [HANDLE_SPEC] [STRUCTOR_SPEC] 
                        [STRUCTOR_SPEC] [PROCESS_SPEC] [FUNCTION_SPEC] (CHANNEL_SPEC,[COM])
   deriving (Eq,Ord,Show,Read )

--instance () => Out (AMPLCODE)  

data CHANNEL_SPEC = Channel_specf [String] [String]
                  | Channel_spec [Int] [Int]
   deriving (Eq,Ord,Show,Read)

data HANDLE_SPEC = Handle_spec String [String]
   deriving (Eq,Ord,Show,Read)

data STRUCTOR_SPEC = Struct_spec String [(String,Int)]
   deriving (Eq,Ord,Show,Read)

data PROCESS_SPEC = Process_specf String [String] ([String],[String]) COMS
                  | Process_spec String ([Int],[Int]) COMS
   deriving (Eq,Ord,Show,Read)

data FUNCTION_SPEC = Function_specf String [String] COMS
                   | Function_spec String COMS
   deriving (Eq,Ord,Show,Read)

---------------------------------------------------------------------------------
--  The commands:
--     commands have a basic and a fancy version
---------------------------------------------------------------------------------
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
