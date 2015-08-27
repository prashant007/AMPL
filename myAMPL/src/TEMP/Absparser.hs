module Absparser where

-- Haskell module generated by the BNF converter


newtype Ident = Ident String deriving (Eq,Ord,Show)
newtype UIdent = UIdent String deriving (Eq,Ord,Show)
data AMPLCODE =
   Main HANDLES COHANDLES CONSTRUCTORS DESTRUCTORS PROCESSES FUNCTIONS START
  deriving (Eq,Ord,Show)

data HANDLE_SPEC =
   Hand_spec UIdent [Handle]
  deriving (Eq,Ord,Show)

data Handle =
   HandName UIdent
  deriving (Eq,Ord,Show)

data CONSTRUCTORS =
   Constructors [STRUCTOR_SPEC]
 | Constructors_none
  deriving (Eq,Ord,Show)

data DESTRUCTORS =
   Destructors [STRUCTOR_SPEC]
 | Destructors_none
  deriving (Eq,Ord,Show)

data STRUCTOR_SPEC =
   Struct_spec UIdent [STRUCT]
  deriving (Eq,Ord,Show)

data STRUCT =
   Struct UIdent Integer
  deriving (Eq,Ord,Show)

data HANDLES =
   Handles [HANDLE_SPEC]
 | Handles_none
  deriving (Eq,Ord,Show)

data COHANDLES =
   Cohandles [HANDLE_SPEC]
 | Cohandles_none
  deriving (Eq,Ord,Show)

data PROCESSES =
   Processes [PROCESS_SPEC]
 | Processes_none
  deriving (Eq,Ord,Show)

data PROCESS_SPEC =
   Process_spec Ident [Vars] [Ident] [Ident] COMS
  deriving (Eq,Ord,Show)

data Vars =
   VName Ident
  deriving (Eq,Ord,Show)

data FUNCTIONS =
   Functions [FUNCTION_SPEC]
 | Functions_none
  deriving (Eq,Ord,Show)

data FUNCTION_SPEC =
   Function_spec Ident [Vars] COMS
  deriving (Eq,Ord,Show)

data START =
   Start CHANNEL_SPEC COMS
  deriving (Eq,Ord,Show)

data CHANNEL_SPEC =
   Channel_specf [Ident] [Ident]
 | Channel_spec [CInteger] [CInteger]
  deriving (Eq,Ord,Show)

data COMS =
   Prog [COM]
  deriving (Eq,Ord,Show)

data COM =
   AC_STOREf Ident
 | AC_LOADf Ident
 | AC_RET
 | AC_FRET
 | AC_CALLf Ident [Ident]
 | AC_INT CInteger
 | AC_LEQ
 | AC_ADD
 | AC_MUL
 | AC_CONS Integer Integer
 | AC_STRUCT UIdent UIdent
 | AC_STRUCTas UIdent UIdent [Ident]
 | AC_CASEf [LABELCOMS]
 | AC_RECORDf [LABELCOMS]
 | AC_DEST Integer Integer
 | AC_GETf Ident
 | AC_HPUTf Ident UIdent UIdent
 | AC_HCASEf Ident [LABELCOMS]
 | AC_PUTf Ident
 | AC_SPLITf Ident Ident Ident
 | AC_FORKf Ident Ident [Ident] COMS Ident [Ident] COMS
 | AC_PLUGf Ident [Ident] COMS [Ident] COMS
 | AC_RUNf Ident [Ident] [Ident] [Ident]
 | AC_IDF Ident Ident
 | AC_CLOSEf Ident
 | AC_HALTf Ident
  deriving (Eq,Ord,Show)

data LABELCOMS =
   Labelcoms1 UIdent UIdent COMS
 | Labelcoms2 UIdent UIdent [Ident] COMS
  deriving (Eq,Ord,Show)

data TRAN =
   TranIn11 Integer Integer
 | TranIn12 Integer Integer
  deriving (Eq,Ord,Show)

data NCInteger =
   Ncinteger CInteger
  deriving (Eq,Ord,Show)

data NIdent =
   Nident1 Ident
  deriving (Eq,Ord,Show)

data CInteger =
   Positive Integer
 | Negative Integer
  deriving (Eq,Ord,Show)
