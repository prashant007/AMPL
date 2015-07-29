{-# LANGUAGE QuasiQuotes, TemplateHaskell #-}

module MyParser.AMPLParserMeta where

import Language.LBNF.Compiletime
import Language.LBNF(lbnf, dumpCode, bnfc)


{-
To use BNFC-Meta first develop your bnfc grammar, and then do the following:

bnfc [lbnf|
  grammar
|]

This will generate via template haskell the code for the lexers and parsers.
-}
bnfc [lbnf|
-- bnfc -m AMPLasm.bnfc
-- make
-- happy -i ParAMPLasm.y
-- ./TestAMPLasm

layout "=" , ":", "as" , "of" , "with" ;
token UIdent (upper (letter|digit|'_')*) ;

Main  .AMPLCODE ::= HANDLES COHANDLES CONSTRUCTORS DESTRUCTORS PROCESSES FUNCTIONS START ;
---------------------------------------------------------------------------------------------
-- An AMPL code file consists of a series of specifcations which can be omitted followed by the code at which one starts.
-- The specifications are:
--      Handles: these are handle names associated with a type.  
--      They are hput on output polarity channels and hcased on input polarity channels
--      Cohandles:  these are handle names associated with a type.
--        They are hput on input polarity channels and hcased on output polarity channels
--      Constructors (and number of arguments)
--      Destructors (and number of arguments)
--      Process definitions
--      Function definitions

---------------------------------------------------------------------------------------------


Hand_spec  .HANDLE_SPEC ::= UIdent "=" "{" [Handle] "}" ;
HandName   .Handle ::= UIdent ;
separator HANDLE_SPEC ";" ;
separator nonempty Handle ";";

Constructors. CONSTRUCTORS ::= "%constructors" ":" "{" [STRUCTOR_SPEC] "}" ;
Constructors_none .CONSTRUCTORS ::= ;

Destructors  .DESTRUCTORS ::= "%destructors" ":" "{" [STRUCTOR_SPEC] "}"  ;
Destructors_none .DESTRUCTORS ::= ;

Struct_spec  .STRUCTOR_SPEC ::= UIdent "=" "{" [STRUCT] "}" ;
Struct       .STRUCT ::= UIdent Integer ;
separator STRUCTOR_SPEC ";" ;
separator nonempty STRUCT ";";

Handles  .HANDLES ::= "%handles"  ":" "{" [HANDLE_SPEC] "}" ;
Handles_none .HANDLES ::= ;

Cohandles  .COHANDLES ::= "%cohandles" ":" "{" [HANDLE_SPEC] "}" ;
Cohandles_none .COHANDLES ::= ;

Processes. PROCESSES  ::= "%processes" ":" "{" [PROCESS_SPEC] "}" ;
Processes_none. PROCESSES ::= ;
separator PROCESS_SPEC ";" ;

Process_spec. PROCESS_SPEC ::= UIdent "::" [Vars] "|" [Ident] "=>" [Ident] "=" COMS ;

VName  .Vars ::= Ident ;
separator Vars ",";

Functions  .FUNCTIONS ::= "%functions" ":" "{" [FUNCTION_SPEC] "}" ;
Functions_none .FUNCTIONS ::= ;
separator FUNCTION_SPEC ";" ;

Function_spec  .FUNCTION_SPEC ::= UIdent "(" [Vars] ")" "=" COMS ;
 
Start  .START   ::= "%run" CHANNEL_SPEC ":" COMS ;

Channel_specf .CHANNEL_SPEC ::= "(" "|" [Ident] "=>" [Ident] ")";
Channel_spec .CHANNEL_SPEC ::= "(" [CInteger] "=>" [CInteger] ")";

Prog    .COMS  ::= "{" [COM] "}"; 
separator COM ";"  ;
  
AC_STORE   .COM   ::= "store" ;
AC_STOREf  .COM   ::= "store" Ident;
AC_LOAD    .COM   ::= "load" Integer ;
AC_LOADf   .COM   ::= "load" Ident ;
AC_RET     .COM   ::= "ret";
AC_FRET    .COM   ::= "fret" ;
AC_CALL    .COM   ::= "call" Ident ;
AC_CALLf   .COM   ::= "call" Ident "(" [Ident] ")" ;
AC_INT     .COM   ::= "cInt" CInteger ;
AC_LEQ     .COM   ::= "leq";
AC_ADD     .COM   ::= "add" ;
AC_MUL     .COM   ::= "mul" ; 
AC_CONCAT  .COM   ::= "concat" ;
AC_REVERSE .COM   ::= "reverse" ;
AC_CONS    .COM   ::= "cons" "(" Integer "," Integer ")" ;
AC_STRUCT  .COM   ::= UIdent "." UIdent ;
AC_STRUCTas.COM   ::= UIdent "." UIdent "(" [Ident] ")" ;
AC_CASE    .COM   ::= "case"  "[" [COMS] "]"  ; 
AC_CASEf   .COM   ::= "case" "of"  "{" [LABELCOMS] "}"  ; 
Labelcoms . LABELCOMS ::= UIdent "." UIdent ":" COMS ;
separator COMS ",";
separator LABELCOMS ";";

AC_RECORD  .COM ::= "rec" "[" [COMS] "]" ;
AC_RECORDf .COM ::= "rec" "of"  "{" [LABELCOMS] "}"  ;
AC_DEST    .COM ::= "dest" Integer Integer ;
AC_GET     .COM ::= "get" CInteger ; 
AC_GETf    .COM ::= "get" Ident ; 
AC_HPUT    .COM ::= "hput"  CInteger  Integer ; 
AC_HPUTf   .COM ::= "hput" Ident  UIdent "." UIdent;
AC_HCASE   .COM ::= "hcase" CInteger "of" "[" [COMS] "]"  ; 
AC_HCASEf  .COM ::= "hcase" Ident "of"  "{" [LABELCOMS] "}"  ; 
AC_PUT     .COM ::= "put" CInteger ;
AC_PUTf    .COM ::= "put" Ident ;
AC_SPLIT   .COM ::= "split" CInteger "into" CInteger  CInteger ;
AC_SPLITf  .COM ::= "split"Ident "into" Ident Ident    ;
AC_FORK    .COM ::= "fork" CInteger "as" "{" CInteger "with" [CInteger] "as" COMS ";" CInteger "with" [CInteger] "as" COMS "}" ;
AC_FORKf   .COM ::= "fork" Ident "as" "{" Ident "with" [Ident] "as" COMS ";" Ident "with" [Ident] "as" COMS "}" ;
AC_PLUG    .COM ::= "plug" [NCInteger] "as" "{" "[" [CInteger] "]" "with" COMS ";" "[" [CInteger] "]" "with" COMS "}" ;
AC_PLUGf   .COM ::= "plug" [NIdent] "as" "{" "[" [Ident] "]" "with" COMS ";" "[" [Ident] "]" "with" COMS "}" ;
AC_RUN     .COM ::= "run" "[" [TRAN] "]" UIdent ;
AC_RUNf     .COM ::= "run" UIdent "(" [Ident] "|" [Ident] "=>" [Ident] ")" ;

separator nonempty NCInteger "," ;
separator nonempty NIdent "," ;
separator Ident "," ;
separator TRAN "," ;

TranIn1. TRAN ::= "(" Integer "," "IN" "," Integer ")" ;
TranIn2. TRAN ::= "(" Integer "," "OUT" "," Integer ")" ;

Ncinteger .NCInteger ::= CInteger ;
Nident .NIdent ::= Ident ;

AC_CLOSE   .COM ::= "close" CInteger ;
AC_CLOSEf  .COM ::= "close" Ident ;
AC_HALT    .COM ::= "halt" CInteger ;
AC_HALTf   .COM ::= "halt" Ident ;

Positive   .CInteger ::= Integer ;
Negative   .CInteger ::= "-" Integer ;
separator CInteger "," ;




-----------------------------------------------------------------------------------
--
-- Comments
--
------------------------------------------------------------------------------------

comment "--" ;
comment "{-" "-}" ;   

|]