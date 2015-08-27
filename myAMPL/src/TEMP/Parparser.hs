{-# OPTIONS_GHC -w #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module Parparser where
import Absparser
import Lexparser
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified GHC.Exts as Happy_GHC_Exts

-- parser produced by Happy Version 1.19.0

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn41 :: (Integer) -> (HappyAbsSyn )
happyIn41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn41 #-}
happyOut41 :: (HappyAbsSyn ) -> (Integer)
happyOut41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut41 #-}
happyIn42 :: (Ident) -> (HappyAbsSyn )
happyIn42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn42 #-}
happyOut42 :: (HappyAbsSyn ) -> (Ident)
happyOut42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut42 #-}
happyIn43 :: (UIdent) -> (HappyAbsSyn )
happyIn43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn43 #-}
happyOut43 :: (HappyAbsSyn ) -> (UIdent)
happyOut43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut43 #-}
happyIn44 :: (AMPLCODE) -> (HappyAbsSyn )
happyIn44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn44 #-}
happyOut44 :: (HappyAbsSyn ) -> (AMPLCODE)
happyOut44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut44 #-}
happyIn45 :: (HANDLE_SPEC) -> (HappyAbsSyn )
happyIn45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn45 #-}
happyOut45 :: (HappyAbsSyn ) -> (HANDLE_SPEC)
happyOut45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut45 #-}
happyIn46 :: (Handle) -> (HappyAbsSyn )
happyIn46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn46 #-}
happyOut46 :: (HappyAbsSyn ) -> (Handle)
happyOut46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut46 #-}
happyIn47 :: ([HANDLE_SPEC]) -> (HappyAbsSyn )
happyIn47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn47 #-}
happyOut47 :: (HappyAbsSyn ) -> ([HANDLE_SPEC])
happyOut47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut47 #-}
happyIn48 :: ([Handle]) -> (HappyAbsSyn )
happyIn48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn48 #-}
happyOut48 :: (HappyAbsSyn ) -> ([Handle])
happyOut48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut48 #-}
happyIn49 :: (CONSTRUCTORS) -> (HappyAbsSyn )
happyIn49 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn49 #-}
happyOut49 :: (HappyAbsSyn ) -> (CONSTRUCTORS)
happyOut49 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut49 #-}
happyIn50 :: (DESTRUCTORS) -> (HappyAbsSyn )
happyIn50 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn50 #-}
happyOut50 :: (HappyAbsSyn ) -> (DESTRUCTORS)
happyOut50 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut50 #-}
happyIn51 :: (STRUCTOR_SPEC) -> (HappyAbsSyn )
happyIn51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn51 #-}
happyOut51 :: (HappyAbsSyn ) -> (STRUCTOR_SPEC)
happyOut51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut51 #-}
happyIn52 :: (STRUCT) -> (HappyAbsSyn )
happyIn52 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn52 #-}
happyOut52 :: (HappyAbsSyn ) -> (STRUCT)
happyOut52 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut52 #-}
happyIn53 :: ([STRUCTOR_SPEC]) -> (HappyAbsSyn )
happyIn53 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn53 #-}
happyOut53 :: (HappyAbsSyn ) -> ([STRUCTOR_SPEC])
happyOut53 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut53 #-}
happyIn54 :: ([STRUCT]) -> (HappyAbsSyn )
happyIn54 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn54 #-}
happyOut54 :: (HappyAbsSyn ) -> ([STRUCT])
happyOut54 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut54 #-}
happyIn55 :: (HANDLES) -> (HappyAbsSyn )
happyIn55 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn55 #-}
happyOut55 :: (HappyAbsSyn ) -> (HANDLES)
happyOut55 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut55 #-}
happyIn56 :: (COHANDLES) -> (HappyAbsSyn )
happyIn56 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn56 #-}
happyOut56 :: (HappyAbsSyn ) -> (COHANDLES)
happyOut56 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut56 #-}
happyIn57 :: (PROCESSES) -> (HappyAbsSyn )
happyIn57 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn57 #-}
happyOut57 :: (HappyAbsSyn ) -> (PROCESSES)
happyOut57 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut57 #-}
happyIn58 :: ([PROCESS_SPEC]) -> (HappyAbsSyn )
happyIn58 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn58 #-}
happyOut58 :: (HappyAbsSyn ) -> ([PROCESS_SPEC])
happyOut58 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut58 #-}
happyIn59 :: (PROCESS_SPEC) -> (HappyAbsSyn )
happyIn59 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn59 #-}
happyOut59 :: (HappyAbsSyn ) -> (PROCESS_SPEC)
happyOut59 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut59 #-}
happyIn60 :: (Vars) -> (HappyAbsSyn )
happyIn60 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn60 #-}
happyOut60 :: (HappyAbsSyn ) -> (Vars)
happyOut60 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut60 #-}
happyIn61 :: ([Vars]) -> (HappyAbsSyn )
happyIn61 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn61 #-}
happyOut61 :: (HappyAbsSyn ) -> ([Vars])
happyOut61 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut61 #-}
happyIn62 :: (FUNCTIONS) -> (HappyAbsSyn )
happyIn62 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn62 #-}
happyOut62 :: (HappyAbsSyn ) -> (FUNCTIONS)
happyOut62 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut62 #-}
happyIn63 :: ([FUNCTION_SPEC]) -> (HappyAbsSyn )
happyIn63 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn63 #-}
happyOut63 :: (HappyAbsSyn ) -> ([FUNCTION_SPEC])
happyOut63 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut63 #-}
happyIn64 :: (FUNCTION_SPEC) -> (HappyAbsSyn )
happyIn64 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn64 #-}
happyOut64 :: (HappyAbsSyn ) -> (FUNCTION_SPEC)
happyOut64 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut64 #-}
happyIn65 :: (START) -> (HappyAbsSyn )
happyIn65 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn65 #-}
happyOut65 :: (HappyAbsSyn ) -> (START)
happyOut65 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut65 #-}
happyIn66 :: (CHANNEL_SPEC) -> (HappyAbsSyn )
happyIn66 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn66 #-}
happyOut66 :: (HappyAbsSyn ) -> (CHANNEL_SPEC)
happyOut66 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut66 #-}
happyIn67 :: (COMS) -> (HappyAbsSyn )
happyIn67 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn67 #-}
happyOut67 :: (HappyAbsSyn ) -> (COMS)
happyOut67 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut67 #-}
happyIn68 :: ([COM]) -> (HappyAbsSyn )
happyIn68 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn68 #-}
happyOut68 :: (HappyAbsSyn ) -> ([COM])
happyOut68 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut68 #-}
happyIn69 :: (COM) -> (HappyAbsSyn )
happyIn69 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn69 #-}
happyOut69 :: (HappyAbsSyn ) -> (COM)
happyOut69 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut69 #-}
happyIn70 :: (LABELCOMS) -> (HappyAbsSyn )
happyIn70 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn70 #-}
happyOut70 :: (HappyAbsSyn ) -> (LABELCOMS)
happyOut70 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut70 #-}
happyIn71 :: ([COMS]) -> (HappyAbsSyn )
happyIn71 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn71 #-}
happyOut71 :: (HappyAbsSyn ) -> ([COMS])
happyOut71 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut71 #-}
happyIn72 :: ([LABELCOMS]) -> (HappyAbsSyn )
happyIn72 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn72 #-}
happyOut72 :: (HappyAbsSyn ) -> ([LABELCOMS])
happyOut72 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut72 #-}
happyIn73 :: ([NCInteger]) -> (HappyAbsSyn )
happyIn73 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn73 #-}
happyOut73 :: (HappyAbsSyn ) -> ([NCInteger])
happyOut73 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut73 #-}
happyIn74 :: ([NIdent]) -> (HappyAbsSyn )
happyIn74 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn74 #-}
happyOut74 :: (HappyAbsSyn ) -> ([NIdent])
happyOut74 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut74 #-}
happyIn75 :: ([Ident]) -> (HappyAbsSyn )
happyIn75 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn75 #-}
happyOut75 :: (HappyAbsSyn ) -> ([Ident])
happyOut75 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut75 #-}
happyIn76 :: ([TRAN]) -> (HappyAbsSyn )
happyIn76 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn76 #-}
happyOut76 :: (HappyAbsSyn ) -> ([TRAN])
happyOut76 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut76 #-}
happyIn77 :: (TRAN) -> (HappyAbsSyn )
happyIn77 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn77 #-}
happyOut77 :: (HappyAbsSyn ) -> (TRAN)
happyOut77 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut77 #-}
happyIn78 :: (NCInteger) -> (HappyAbsSyn )
happyIn78 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn78 #-}
happyOut78 :: (HappyAbsSyn ) -> (NCInteger)
happyOut78 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut78 #-}
happyIn79 :: (NIdent) -> (HappyAbsSyn )
happyIn79 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn79 #-}
happyOut79 :: (HappyAbsSyn ) -> (NIdent)
happyOut79 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut79 #-}
happyIn80 :: (CInteger) -> (HappyAbsSyn )
happyIn80 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn80 #-}
happyOut80 :: (HappyAbsSyn ) -> (CInteger)
happyOut80 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut80 #-}
happyIn81 :: ([CInteger]) -> (HappyAbsSyn )
happyIn81 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn81 #-}
happyOut81 :: (HappyAbsSyn ) -> ([CInteger])
happyOut81 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut81 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x04\x02\xd2\x01\xd2\x01\xd2\x01\xd2\x01\x05\x02\x03\x02\xcf\x01\xcf\x01\xcf\x01\xcf\x01\xff\x01\x00\x02\xfd\x01\xcd\x01\xcd\x01\xcd\x01\xcd\x01\xfb\x01\xcb\x01\xcb\x01\xf7\x01\xee\x01\xcc\x01\x60\x00\x60\x00\xc6\x01\xca\x01\xc2\x01\xfb\xff\xc5\x01\xc5\x01\xf9\xff\xeb\x01\xfb\xff\xc4\x01\xfb\xff\xfb\xff\xc1\x01\x00\x00\x00\x00\xe5\x01\xbf\x01\xbe\x01\xbc\x01\x00\x00\xbc\x01\x00\x00\xbc\x01\x00\x00\xbc\x01\xba\x01\xb9\x01\xf8\xff\xe3\x01\xb8\x01\xb8\x01\xe2\x01\xb3\x01\xdf\x01\xdc\x01\xd7\x01\xb2\x01\x00\x00\xda\x01\xaf\x01\x60\x00\xaf\x01\xd5\x01\xd6\x01\xad\x01\x00\x00\xfb\xff\xac\x01\xb7\x01\xab\x01\xd4\x01\xaa\x01\xa8\x01\x00\x00\xa8\x01\xa8\x01\xa8\x01\xa8\x01\x00\x00\xa8\x01\x00\x00\xa8\x01\xa8\x01\xb0\x01\x00\x00\xa5\x01\xa5\x01\xa5\x01\xa3\x01\xc8\x01\xa1\x01\xa1\x01\xfa\xff\xa1\x01\xce\x01\xc7\x01\x9d\x01\x9d\x01\xc3\x01\x9c\x01\xc0\x01\x00\x00\xbb\x01\x9b\x01\x9b\x01\xa7\x01\x99\x01\x99\x01\xbd\x01\x98\x01\xb6\x01\x96\x01\xb5\x01\x93\x01\xb4\x01\x94\x01\xb1\x01\x92\x01\xae\x01\xa2\x01\x91\x01\x91\x01\x91\x01\x91\x01\xa0\x01\x8f\x01\x9f\x01\x00\x00\x9a\x01\x8e\x01\x95\x01\x8d\x01\x8c\x01\x8c\x01\x8c\x01\x8c\x01\x97\x01\x90\x01\x89\x01\x8b\x01\x87\x01\x8a\x01\x88\x01\x84\x01\x86\x01\x82\x01\x00\x00\x85\x01\x83\x01\x81\x01\x80\x01\x80\x01\x80\x01\x7f\x01\x7e\x01\x7e\x01\x7d\x01\x7b\x01\x79\x01\x60\x00\x00\x00\x7c\x01\x77\x01\x7a\x01\x00\x00\x78\x01\x00\x00\x74\x01\x72\x01\x00\x00\x00\x00\x76\x01\x73\x01\x73\x01\x00\x00\x71\x01\x75\x01\x00\x00\x70\x01\x6f\x01\x6e\x01\x68\x01\x6d\x01\x6d\x01\xfb\xff\x6a\x01\x6a\x01\xf9\xff\xf9\xff\x6c\x01\x00\x00\xfb\xff\x00\x00\xea\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6b\x01\x69\x01\x67\x01\x66\x01\x00\x00\x65\x01\x64\x01\x62\x01\x63\x01\x61\x01\x5e\x01\x5e\x01\x00\x00\x60\x01\xfb\xff\x5f\x01\x5d\x01\x00\x00\x5c\x01\x00\x00\x59\x01\x00\x00\x5a\x01\x58\x01\x58\x01\x00\x00\x58\x01\x00\x00\x58\x01\x58\x01\x00\x00\x58\x01\x00\x00\x57\x01\x5b\x01\x56\x01\x55\x01\x54\x01\x53\x01\x52\x01\x51\x01\x4f\x01\x4e\x01\x4d\x01\x50\x01\x00\x00\x49\x01\x4c\x01\x4c\x01\xf1\x00\x4b\x01\x4a\x01\xe9\x00\xe9\x00\x46\x01\x48\x01\x47\x01\x45\x01\x44\x01\x44\x01\x43\x01\x42\x01\x41\x01\x3e\x01\x3e\x01\x00\x00\x40\x01\x3f\x01\x00\x00\x00\x00\x3d\x01\x3b\x01\xfd\x00\x00\x00\x3a\x01\x00\x00\x3a\x01\x00\x00\x39\x01\x00\x00\x37\x01\x00\x00\x36\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x01\x38\x01\x35\x01\x00\x00\x00\x00\x32\x01\x30\x01\x00\x00\x2f\x01\x00\x00\x00\x00\x31\x01\x34\x01\x33\x01\x00\x00\x00\x00\x2e\x01\x2d\x01\x2a\x01\x28\x01\x2c\x01\x00\x00\x2b\x01\x29\x01\x27\x01\x27\x01\x00\x00\x25\x01\x24\x01\x00\x00\xfe\x00\x00\x00\x26\x01\xfc\x00\xf9\x00\xf0\x00\x23\x01\xe8\x00\x22\x01\x21\x01\xf5\x00\xf5\x00\xef\x00\xeb\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x55\x00\x5c\x00\x0e\x00\xf2\x00\xe5\x00\x20\x01\x1e\x01\x5b\x00\x0c\x00\xd8\x00\xc8\x00\x1f\x01\x1d\x01\x1a\x01\xbe\x00\x59\x00\x56\x00\xaf\x00\x16\x01\xa5\x00\x09\x00\x08\x01\x0b\x01\x07\x01\x9a\x00\x9c\x00\x8f\x00\xdd\x00\x8e\x00\x19\x00\x21\x00\x53\x00\xb9\x00\xf4\x00\x15\x00\x1d\x00\x1a\x00\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1c\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1b\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x98\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x14\x00\x19\x01\x00\x00\x18\x01\x00\x00\x17\x01\x15\x01\x00\x00\x14\x01\x13\x01\x12\x01\x11\x01\x00\x00\x10\x01\x00\x00\x0f\x01\x0e\x01\x00\x00\x00\x00\x0d\x01\x0c\x01\x0a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x0d\x00\x00\x00\xf3\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x09\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfb\x00\xff\x00\xed\x00\x00\x00\xe1\x00\x00\x00\x00\x00\xd5\x00\x00\x00\xc7\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbc\x00\xad\x00\x54\x00\x00\x00\xa3\x00\x08\x00\x00\x00\x00\x00\x52\x00\x96\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x06\x01\x00\x00\x00\x00\x00\x00\x00\x00\x05\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x04\x01\x03\x01\x00\x00\xdb\x00\x86\x00\x01\x01\x18\x00\x07\x00\x51\x00\xa8\x00\xa1\x00\x00\x00\x00\x00\x0b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x50\x00\x82\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x75\x00\x4f\x00\x00\x01\x00\x00\x00\x00\x03\x00\xe6\x00\x00\x00\x00\x00\x92\x00\x00\x00\x00\x00\x00\x00\xb6\x00\xec\x00\xe7\x00\x00\x00\x57\x00\x00\x00\xd4\x00\xcf\x00\x00\x00\x5a\x00\x00\x00\xf6\x00\xee\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\xe4\x00\x00\x00\x00\x00\x00\x00\xd6\x00\x02\x00\x25\x00\xfa\x00\x00\x00\x00\x00\x4c\x00\x4b\x00\xa4\x00\x00\x00\x00\x00\xc6\x00\x66\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4a\x00\x00\x00\x48\x00\x00\x00\x00\x00\x00\x00\x95\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8b\x00\x05\x00\x28\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x26\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x90\x00\x00\x00\x00\x00\x24\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8d\x00\x88\x00\x00\x00\x00\x00\x00\x00\x00\x00\x41\x00\x00\x00\x00\x00\x11\x00\x00\x00\x23\x00\x00\x00\x22\x00\x00\x00\x00\x00\x3c\x00\xfc\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xc2\xff\x00\x00\x00\x00\xd3\xff\x00\x00\xcd\xff\xcb\xff\x00\x00\x00\x00\xc8\xff\x00\x00\xc2\xff\xc0\xff\xbe\xff\xbd\xff\x00\x00\x00\x00\xb8\xff\xb4\xff\xb3\xff\x00\x00\x00\x00\x00\x00\x00\x00\xab\xff\x00\x00\x00\x00\x8c\xff\x89\xff\x00\x00\x00\x00\x82\xff\x7c\xff\x00\x00\x00\x00\x00\x00\x00\x00\x73\xff\x00\x00\xd9\xff\x75\xff\x72\xff\x00\x00\x00\x00\x00\x00\x76\xff\x00\x00\xd8\xff\x00\x00\x77\xff\x00\x00\x00\x00\x00\x00\x7b\xff\x81\xff\x00\x00\x00\x00\x84\xff\x00\x00\x86\xff\x00\x00\x88\xff\x00\x00\xd7\xff\x8b\xff\x00\x00\xab\xff\x00\x00\x00\x00\x00\x00\x00\x00\xa1\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa5\xff\x00\x00\x00\x00\x00\x00\x00\x00\xa2\xff\x00\x00\xa0\xff\x00\x00\x00\x00\x00\x00\xa6\xff\x00\x00\x00\x00\x00\x00\x00\x00\xaa\xff\x00\x00\x00\x00\x73\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb2\xff\x00\x00\x00\x00\xb9\xff\xb7\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbc\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc5\xff\x00\x00\x00\x00\xc7\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd4\xff\xd0\xff\x00\x00\x00\x00\xd2\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc0\xff\xcd\xff\xd3\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc8\xff\x00\x00\x00\x00\xc9\xff\x00\x00\x00\x00\x00\x00\xbd\xff\xb8\xff\xb8\xff\x00\x00\xb3\xff\xb8\xff\x00\x00\x00\x00\x82\xff\xab\xff\xa8\xff\x00\x00\x00\x00\x00\x00\x96\xff\x00\x00\xa7\xff\x00\x00\x00\x00\x8f\xff\x99\xff\x00\x00\x00\x00\x00\x00\x90\xff\x00\x00\x00\x00\xa3\xff\x00\x00\x00\x00\x00\x00\x8c\xff\x89\xff\x00\x00\x00\x00\x00\x00\x82\xff\x7c\xff\x7c\xff\x00\x00\x74\xff\x73\xff\x71\xff\x00\x00\x7a\xff\x7d\xff\x80\xff\x83\xff\x85\xff\x00\x00\x87\xff\x8a\xff\xac\xff\x91\xff\x9e\xff\x82\xff\x89\xff\x00\x00\x9a\xff\x00\x00\x00\x00\x00\x00\x00\x00\x89\xff\x82\xff\x00\x00\xa9\xff\x00\x00\x73\xff\x00\x00\x00\x00\xb1\xff\xb3\xff\xb6\xff\x00\x00\xbb\xff\xbd\xff\xd3\xff\xd3\xff\xc4\xff\x00\x00\xc6\xff\xc8\xff\xc8\xff\xcf\xff\x00\x00\xd1\xff\xcb\xff\xbe\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x82\xff\x00\x00\x00\x00\xaf\xff\x00\x00\x82\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x89\xff\x00\x00\x00\x00\x00\x00\x00\x00\x82\xff\x82\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8e\xff\x00\x00\x00\x00\xa4\xff\x9c\xff\x00\x00\x00\x00\x00\x00\x98\xff\x82\xff\x9b\xff\x82\xff\x95\xff\x00\x00\xad\xff\x00\x00\xb5\xff\x00\x00\xbf\xff\xc1\xff\xc3\xff\xca\xff\xcc\xff\xce\xff\xd5\xff\xb4\xff\x00\x00\x82\xff\xb0\xff\xae\xff\x00\x00\x00\x00\x97\xff\x82\xff\x9f\xff\x9d\xff\x00\x00\x00\x00\x00\x00\x78\xff\x79\xff\x00\x00\x00\x00\x00\x00\x82\xff\x00\x00\xd6\xff\x00\x00\x00\x00\x00\x00\x00\x00\x8d\xff\x00\x00\x00\x00\x92\xff\x00\x00\xba\xff\x00\x00\x00\x00\x00\x00\x82\xff\x00\x00\x82\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x93\xff\x94\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x08\x00\x0a\x00\x00\x00\x02\x00\x0b\x00\x0b\x00\x0f\x00\x01\x00\x01\x00\x01\x00\x00\x00\x08\x00\x00\x00\x02\x00\x00\x00\x02\x00\x0d\x00\x01\x00\x05\x00\x00\x00\x00\x00\x1a\x00\x0b\x00\x00\x00\x00\x00\x00\x00\x13\x00\x14\x00\x18\x00\x01\x00\x1d\x00\x17\x00\x1f\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x21\x00\x01\x00\x27\x00\x28\x00\x32\x00\x26\x00\x34\x00\x34\x00\x38\x00\x38\x00\x27\x00\x28\x00\x27\x00\x28\x00\x27\x00\x28\x00\x20\x00\x20\x00\x25\x00\x27\x00\x27\x00\x25\x00\x25\x00\x27\x00\x27\x00\x27\x00\x21\x00\x26\x00\x22\x00\x22\x00\x22\x00\x26\x00\x22\x00\x01\x00\x22\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x1a\x00\x01\x00\x03\x00\x02\x00\x01\x00\x1a\x00\x02\x00\x02\x00\x02\x00\x05\x00\x04\x00\x07\x00\x0b\x00\x0e\x00\x0d\x00\x0a\x00\x00\x00\x13\x00\x14\x00\x13\x00\x22\x00\x12\x00\x22\x00\x22\x00\x22\x00\x22\x00\x22\x00\x22\x00\x22\x00\x22\x00\x22\x00\x22\x00\x16\x00\x02\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x02\x00\x25\x00\x26\x00\x27\x00\x02\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x02\x00\x02\x00\x1d\x00\x01\x00\x1f\x00\x35\x00\x36\x00\x01\x00\x02\x00\x01\x00\x02\x00\x01\x00\x02\x00\x01\x00\x02\x00\x1d\x00\x15\x00\x1f\x00\x1a\x00\x1d\x00\x01\x00\x1f\x00\x01\x00\x1a\x00\x16\x00\x17\x00\x1a\x00\x1d\x00\x1d\x00\x1f\x00\x01\x00\x1a\x00\x01\x00\x1b\x00\x1c\x00\x1b\x00\x1c\x00\x1b\x00\x1c\x00\x01\x00\x1c\x00\x16\x00\x17\x00\x16\x00\x17\x00\x01\x00\x1a\x00\x01\x00\x13\x00\x14\x00\x13\x00\x14\x00\x23\x00\x24\x00\x00\x00\x11\x00\x12\x00\x02\x00\x02\x00\x23\x00\x24\x00\x11\x00\x12\x00\x11\x00\x12\x00\x02\x00\x0b\x00\x0b\x00\x0d\x00\x0d\x00\x02\x00\x02\x00\x02\x00\x0a\x00\x02\x00\x0c\x00\x23\x00\x24\x00\x0a\x00\x0a\x00\x0c\x00\x0c\x00\x0a\x00\x02\x00\x0c\x00\x01\x00\x05\x00\x02\x00\x07\x00\x02\x00\x05\x00\x04\x00\x07\x00\x06\x00\x02\x00\x02\x00\x04\x00\x04\x00\x06\x00\x06\x00\x02\x00\x1a\x00\x04\x00\x1a\x00\x06\x00\x1e\x00\x00\x00\x1e\x00\x12\x00\x13\x00\x10\x00\x09\x00\x1a\x00\x01\x00\x00\x00\x02\x00\x01\x00\x00\x00\x02\x00\x08\x00\x02\x00\x00\x00\x0f\x00\x01\x00\x19\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x00\x00\x24\x00\x01\x00\x01\x00\x00\x00\x00\x00\x35\x00\x33\x00\x36\x00\x18\x00\x1a\x00\x33\x00\x32\x00\x19\x00\x35\x00\x31\x00\x09\x00\x08\x00\x30\x00\x10\x00\x15\x00\x0f\x00\x0e\x00\x0d\x00\x31\x00\x33\x00\x35\x00\x09\x00\x0f\x00\x0f\x00\x09\x00\xff\xff\x0d\x00\x15\x00\x17\x00\x14\x00\x10\x00\x09\x00\x09\x00\x0d\x00\x07\x00\x04\x00\xff\xff\x09\x00\x11\x00\x17\x00\x15\x00\x09\x00\x11\x00\x09\x00\x09\x00\xff\xff\x0a\x00\x0a\x00\xff\xff\x09\x00\xff\xff\xff\xff\xff\xff\x09\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x31\x00\xff\xff\x03\x00\xff\xff\xff\xff\x35\x00\x14\x00\x31\x00\x10\x00\x06\x00\xff\xff\xff\xff\x35\x00\xff\xff\x09\x00\xff\xff\x31\x00\xff\xff\x35\x00\x30\x00\xff\xff\xff\xff\x0c\x00\x35\x00\x0a\x00\x11\x00\x34\x00\x08\x00\x31\x00\xff\xff\x0a\x00\xff\xff\xff\xff\x35\x00\x33\x00\x35\x00\x34\x00\x08\x00\x33\x00\x08\x00\x33\x00\x35\x00\x33\x00\x35\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x0d\x00\x32\x00\x11\x00\x17\x00\x36\x00\x35\x00\x31\x00\x35\x00\x02\x00\x35\x00\x31\x00\x31\x00\x31\x00\x36\x00\x01\x00\x31\x00\x28\x00\xff\xff\x0f\x00\x36\x00\x35\x00\x35\x00\x24\x00\x33\x00\x31\x00\x36\x00\x35\x00\x10\x00\x36\x00\x34\x00\x30\x00\x0f\x00\x36\x00\x31\x00\x0d\x00\x0d\x00\x35\x00\x08\x00\x31\x00\x0f\x00\x31\x00\x35\x00\x31\x00\x35\x00\x31\x00\x31\x00\x36\x00\x31\x00\x36\x00\x31\x00\x31\x00\x36\x00\x10\x00\x36\x00\x0f\x00\x0d\x00\x0d\x00\x0d\x00\x38\x00\x0a\x00\x38\x00\x38\x00\x34\x00\x38\x00\x38\x00\x38\x00\x0f\x00\x0d\x00\x38\x00\x08\x00\x38\x00\x38\x00\x0f\x00\x38\x00\x38\x00\x38\x00\x08\x00\x0f\x00\x28\x00\x38\x00\x35\x00\x38\x00\x08\x00\x35\x00\x34\x00\x28\x00\x35\x00\x35\x00\x0c\x00\x0e\x00\x0a\x00\x38\x00\x0f\x00\x38\x00\x0c\x00\x0a\x00\x38\x00\x38\x00\x0a\x00\x0a\x00\x34\x00\x0a\x00\x38\x00\x38\x00\x34\x00\x08\x00\x38\x00\x34\x00\x08\x00\x38\x00\x36\x00\x35\x00\x35\x00\x31\x00\x36\x00\x31\x00\x07\x00\x04\x00\x35\x00\x01\x00\x35\x00\x06\x00\x05\x00\x36\x00\x03\x00\x02\x00\x36\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x34\x00\xc2\x00\x28\x00\x3c\x00\x2c\x00\x2c\x00\xc3\x00\x2d\x00\x6b\x00\x65\x00\x28\x00\x0e\x01\x28\x00\x79\x00\x28\x00\x85\x00\x0f\x01\x4e\x01\x8b\x00\x28\x00\x28\x00\x56\x01\x7f\x00\x28\x00\x28\x00\x28\x00\x6c\x00\xe2\x00\x41\x01\x2d\x00\x3d\x00\x66\x00\x1a\x01\x2d\x00\x36\x00\x36\x00\x36\x00\x19\x01\x36\x00\xcb\x00\x36\x00\x29\x00\x00\x01\xa5\x00\x39\x00\x28\x00\x28\x00\x7b\xff\x7c\xff\x29\x00\xc6\x00\x29\x00\xa3\x00\x29\x00\x2a\x00\xcc\x00\x3a\x00\x30\x00\xb7\x00\x31\x00\x3b\x00\x3b\x00\x31\x00\x31\x00\x2c\x00\x38\x00\x2e\x00\x52\x01\x50\x01\x43\x01\x39\x00\x3d\x01\x36\x00\x40\x01\x36\x00\x36\x00\x36\x00\x36\x00\x36\x00\x36\x00\x36\x00\x36\x00\x36\x00\x36\x00\x6b\x00\x57\x01\x6b\x00\x8d\x00\x79\x00\x6f\x00\x4b\x01\x85\x00\x7c\x00\x88\x00\x86\x00\x8c\x00\xf5\x00\x7a\x00\x8e\x00\xf8\x00\x80\x00\x38\x01\x6c\x00\xe5\x00\x6e\x00\x31\x01\x70\x00\x32\x01\x14\x01\x15\x01\x20\x01\x24\x01\x03\x01\x0b\x01\xca\x00\xdf\x00\x37\x00\x48\x00\x3c\x00\x49\x00\x4a\x00\x4b\x00\x4c\x00\x4d\x00\x4e\x00\x4f\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x3c\x00\x55\x00\x56\x00\x57\x00\x3c\x00\x58\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x5d\x00\x5e\x00\x3c\x00\x3c\x00\x3d\x00\x65\x00\x04\x01\x30\x00\x40\x00\x44\x00\x45\x00\x44\x00\x45\x00\x44\x00\x45\x00\x44\x00\x45\x00\x3d\x00\x2d\x01\x0a\x01\x47\x01\x3d\x00\x65\x00\xce\x00\x65\x00\x48\x01\xfd\x00\x68\x00\x46\x01\x3d\x00\x43\x00\x3e\x00\x6b\x00\x2f\x01\x6b\x00\xde\x00\x5f\x00\xba\x00\x5f\x00\x5e\x00\x5f\x00\x6f\x00\x46\x00\xe3\x00\x68\x00\x67\x00\x68\x00\x6f\x00\x13\x01\x6f\x00\x6c\x00\xe6\x00\x6c\x00\x6d\x00\xc8\x00\x35\x00\x39\x01\xfb\x00\x72\x00\x79\x00\x79\x00\xc9\x00\x35\x00\xe7\x00\x72\x00\x71\x00\x72\x00\x7c\x00\x7a\x00\x7a\x00\xeb\x00\x7b\x00\x7c\x00\x7c\x00\x1b\x01\x7d\x00\x7c\x00\xf6\x00\x34\x00\x35\x00\x7d\x00\x7d\x00\xf7\x00\xed\x00\x7d\x00\x85\x00\x7e\x00\x1f\x01\x86\x00\x85\x00\xf0\x00\x88\x00\x86\x00\x89\x00\x87\x00\xf9\x00\x88\x00\x88\x00\x89\x00\x89\x00\xfa\x00\xf2\x00\x88\x00\x40\x00\x89\x00\x40\x00\x8a\x00\xcf\x00\x18\x01\x41\x00\x10\x01\x11\x01\x2c\x01\xf4\x00\xff\x00\x02\x01\xd5\x00\xcd\x00\xd1\x00\xd6\x00\xd2\x00\xf3\x00\xd9\x00\x98\x00\x8f\x00\xa6\x00\xa2\x00\xa7\x00\xa8\x00\xaa\x00\xab\x00\xac\x00\xad\x00\xae\x00\xaf\x00\xb0\x00\xb1\x00\xb2\x00\x32\x00\xb4\x00\xb6\x00\xc3\x00\xc4\x00\x30\x00\x59\x01\x40\x00\x63\x00\x60\x00\x5a\x01\x1f\x01\x61\x00\x30\x00\x43\x00\x81\x00\x83\x00\x52\x01\x73\x00\x69\x00\x75\x00\x77\x00\x55\x01\x43\x00\x34\x01\x30\x00\x4a\x01\x4d\x01\x4e\x01\x43\x01\x00\x00\x45\x01\x54\x01\x56\x01\x50\x01\x4b\x01\x3b\x01\x3c\x01\x3d\x01\x65\x00\x6b\x00\x00\x00\x31\x01\x40\x01\x46\x01\x3f\x01\x36\x01\x2f\x01\x37\x01\x38\x01\x00\x00\x12\x01\x13\x01\x00\x00\x17\x01\x00\x00\x00\x00\x00\x00\x22\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x43\x00\x00\x00\x83\x00\x00\x00\x00\x00\x30\x00\x1d\x01\x43\x00\x23\x01\x75\x00\x00\x00\x00\x00\x30\x00\x00\x00\xff\x00\x00\x00\x43\x00\x00\x00\x30\x00\x35\x01\x00\x00\x00\x00\x07\x01\x30\x00\x0a\x01\x02\x01\x28\x00\x0d\x01\x43\x00\x00\x00\xc8\x00\x00\x00\x00\x00\x30\x00\x18\x01\x30\x00\x28\x00\xd4\x00\x1e\x01\xdd\x00\x24\x01\x30\x00\x26\x01\x30\x00\x27\x01\x28\x01\x29\x01\x2a\x01\x2b\x01\x2c\x01\xe2\x00\xfd\x00\xe1\x00\xd8\x00\x40\x00\x30\x00\x43\x00\x30\x00\x85\x00\x30\x00\x06\x01\x08\x01\x09\x01\x40\x00\x77\x00\x43\x00\xd9\x00\x00\x00\x91\x00\x40\x00\x30\x00\x30\x00\xde\x00\xd1\x00\xd5\x00\x40\x00\x30\x00\x92\x00\x40\x00\x28\x00\xdb\x00\x93\x00\x40\x00\xdc\x00\x94\x00\x95\x00\x30\x00\x9e\x00\xe5\x00\x96\x00\xe9\x00\x30\x00\xea\x00\x30\x00\xeb\x00\xed\x00\x40\x00\xef\x00\x40\x00\xf0\x00\xf2\x00\x40\x00\x97\x00\x40\x00\x98\x00\x9a\x00\x9b\x00\x9c\x00\xff\xff\x9f\x00\xff\xff\xff\xff\x28\x00\xff\xff\xff\xff\xff\xff\x9d\x00\xa0\x00\xff\xff\xa2\x00\xff\xff\xff\xff\xa1\x00\xff\xff\xff\xff\xff\xff\x63\x00\xa6\x00\xaa\x00\xff\xff\x30\x00\xff\xff\xb4\x00\x30\x00\x28\x00\xb6\x00\x30\x00\x30\x00\xb9\x00\xba\x00\xbc\x00\xff\xff\xbd\x00\xff\xff\xbe\x00\xbf\x00\xff\xff\xff\xff\xc0\x00\xc1\x00\x28\x00\xc6\x00\xff\xff\xff\xff\x28\x00\x34\x00\xff\xff\x28\x00\x63\x00\xff\xff\x40\x00\x30\x00\x30\x00\x43\x00\x40\x00\x43\x00\x65\x00\x6b\x00\x30\x00\x77\x00\x30\x00\x75\x00\x79\x00\x40\x00\x83\x00\x85\x00\x40\x00\x79\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (38, 142) [
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94),
	(95 , happyReduce_95),
	(96 , happyReduce_96),
	(97 , happyReduce_97),
	(98 , happyReduce_98),
	(99 , happyReduce_99),
	(100 , happyReduce_100),
	(101 , happyReduce_101),
	(102 , happyReduce_102),
	(103 , happyReduce_103),
	(104 , happyReduce_104),
	(105 , happyReduce_105),
	(106 , happyReduce_106),
	(107 , happyReduce_107),
	(108 , happyReduce_108),
	(109 , happyReduce_109),
	(110 , happyReduce_110),
	(111 , happyReduce_111),
	(112 , happyReduce_112),
	(113 , happyReduce_113),
	(114 , happyReduce_114),
	(115 , happyReduce_115),
	(116 , happyReduce_116),
	(117 , happyReduce_117),
	(118 , happyReduce_118),
	(119 , happyReduce_119),
	(120 , happyReduce_120),
	(121 , happyReduce_121),
	(122 , happyReduce_122),
	(123 , happyReduce_123),
	(124 , happyReduce_124),
	(125 , happyReduce_125),
	(126 , happyReduce_126),
	(127 , happyReduce_127),
	(128 , happyReduce_128),
	(129 , happyReduce_129),
	(130 , happyReduce_130),
	(131 , happyReduce_131),
	(132 , happyReduce_132),
	(133 , happyReduce_133),
	(134 , happyReduce_134),
	(135 , happyReduce_135),
	(136 , happyReduce_136),
	(137 , happyReduce_137),
	(138 , happyReduce_138),
	(139 , happyReduce_139),
	(140 , happyReduce_140),
	(141 , happyReduce_141),
	(142 , happyReduce_142)
	]

happy_n_terms = 57 :: Int
happy_n_nonterms = 41 :: Int

happyReduce_38 = happySpecReduce_1  0# happyReduction_38
happyReduction_38 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TI happy_var_1)) -> 
	happyIn41
		 ((read ( happy_var_1)) :: Integer
	)}

happyReduce_39 = happySpecReduce_1  1# happyReduction_39
happyReduction_39 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn42
		 (Ident happy_var_1
	)}

happyReduce_40 = happySpecReduce_1  2# happyReduction_40
happyReduction_40 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (T_UIdent happy_var_1)) -> 
	happyIn43
		 (UIdent (happy_var_1)
	)}

happyReduce_41 = happyReduce 7# 3# happyReduction_41
happyReduction_41 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut55 happy_x_1 of { happy_var_1 -> 
	case happyOut56 happy_x_2 of { happy_var_2 -> 
	case happyOut49 happy_x_3 of { happy_var_3 -> 
	case happyOut50 happy_x_4 of { happy_var_4 -> 
	case happyOut57 happy_x_5 of { happy_var_5 -> 
	case happyOut62 happy_x_6 of { happy_var_6 -> 
	case happyOut65 happy_x_7 of { happy_var_7 -> 
	happyIn44
		 (Main happy_var_1 happy_var_2 happy_var_3 happy_var_4 happy_var_5 happy_var_6 happy_var_7
	) `HappyStk` happyRest}}}}}}}

happyReduce_42 = happyReduce 5# 4# happyReduction_42
happyReduction_42 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut43 happy_x_1 of { happy_var_1 -> 
	case happyOut48 happy_x_4 of { happy_var_4 -> 
	happyIn45
		 (Hand_spec happy_var_1 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_43 = happySpecReduce_1  5# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut43 happy_x_1 of { happy_var_1 -> 
	happyIn46
		 (HandName happy_var_1
	)}

happyReduce_44 = happySpecReduce_0  6# happyReduction_44
happyReduction_44  =  happyIn47
		 ([]
	)

happyReduce_45 = happySpecReduce_1  6# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOut45 happy_x_1 of { happy_var_1 -> 
	happyIn47
		 ((:[]) happy_var_1
	)}

happyReduce_46 = happySpecReduce_3  6# happyReduction_46
happyReduction_46 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut45 happy_x_1 of { happy_var_1 -> 
	case happyOut47 happy_x_3 of { happy_var_3 -> 
	happyIn47
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_47 = happySpecReduce_1  7# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOut46 happy_x_1 of { happy_var_1 -> 
	happyIn48
		 ((:[]) happy_var_1
	)}

happyReduce_48 = happySpecReduce_3  7# happyReduction_48
happyReduction_48 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut46 happy_x_1 of { happy_var_1 -> 
	case happyOut48 happy_x_3 of { happy_var_3 -> 
	happyIn48
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_49 = happyReduce 5# 8# happyReduction_49
happyReduction_49 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut53 happy_x_4 of { happy_var_4 -> 
	happyIn49
		 (Constructors happy_var_4
	) `HappyStk` happyRest}

happyReduce_50 = happySpecReduce_0  8# happyReduction_50
happyReduction_50  =  happyIn49
		 (Constructors_none
	)

happyReduce_51 = happyReduce 5# 9# happyReduction_51
happyReduction_51 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut53 happy_x_4 of { happy_var_4 -> 
	happyIn50
		 (Destructors happy_var_4
	) `HappyStk` happyRest}

happyReduce_52 = happySpecReduce_0  9# happyReduction_52
happyReduction_52  =  happyIn50
		 (Destructors_none
	)

happyReduce_53 = happyReduce 5# 10# happyReduction_53
happyReduction_53 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut43 happy_x_1 of { happy_var_1 -> 
	case happyOut54 happy_x_4 of { happy_var_4 -> 
	happyIn51
		 (Struct_spec happy_var_1 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_54 = happySpecReduce_2  11# happyReduction_54
happyReduction_54 happy_x_2
	happy_x_1
	 =  case happyOut43 happy_x_1 of { happy_var_1 -> 
	case happyOut41 happy_x_2 of { happy_var_2 -> 
	happyIn52
		 (Struct happy_var_1 happy_var_2
	)}}

happyReduce_55 = happySpecReduce_0  12# happyReduction_55
happyReduction_55  =  happyIn53
		 ([]
	)

happyReduce_56 = happySpecReduce_1  12# happyReduction_56
happyReduction_56 happy_x_1
	 =  case happyOut51 happy_x_1 of { happy_var_1 -> 
	happyIn53
		 ((:[]) happy_var_1
	)}

happyReduce_57 = happySpecReduce_3  12# happyReduction_57
happyReduction_57 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut51 happy_x_1 of { happy_var_1 -> 
	case happyOut53 happy_x_3 of { happy_var_3 -> 
	happyIn53
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_58 = happySpecReduce_1  13# happyReduction_58
happyReduction_58 happy_x_1
	 =  case happyOut52 happy_x_1 of { happy_var_1 -> 
	happyIn54
		 ((:[]) happy_var_1
	)}

happyReduce_59 = happySpecReduce_3  13# happyReduction_59
happyReduction_59 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut52 happy_x_1 of { happy_var_1 -> 
	case happyOut54 happy_x_3 of { happy_var_3 -> 
	happyIn54
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_60 = happyReduce 5# 14# happyReduction_60
happyReduction_60 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut47 happy_x_4 of { happy_var_4 -> 
	happyIn55
		 (Handles happy_var_4
	) `HappyStk` happyRest}

happyReduce_61 = happySpecReduce_0  14# happyReduction_61
happyReduction_61  =  happyIn55
		 (Handles_none
	)

happyReduce_62 = happyReduce 5# 15# happyReduction_62
happyReduction_62 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut47 happy_x_4 of { happy_var_4 -> 
	happyIn56
		 (Cohandles happy_var_4
	) `HappyStk` happyRest}

happyReduce_63 = happySpecReduce_0  15# happyReduction_63
happyReduction_63  =  happyIn56
		 (Cohandles_none
	)

happyReduce_64 = happyReduce 5# 16# happyReduction_64
happyReduction_64 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut58 happy_x_4 of { happy_var_4 -> 
	happyIn57
		 (Processes happy_var_4
	) `HappyStk` happyRest}

happyReduce_65 = happySpecReduce_0  16# happyReduction_65
happyReduction_65  =  happyIn57
		 (Processes_none
	)

happyReduce_66 = happySpecReduce_0  17# happyReduction_66
happyReduction_66  =  happyIn58
		 ([]
	)

happyReduce_67 = happySpecReduce_1  17# happyReduction_67
happyReduction_67 happy_x_1
	 =  case happyOut59 happy_x_1 of { happy_var_1 -> 
	happyIn58
		 ((:[]) happy_var_1
	)}

happyReduce_68 = happySpecReduce_3  17# happyReduction_68
happyReduction_68 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut59 happy_x_1 of { happy_var_1 -> 
	case happyOut58 happy_x_3 of { happy_var_3 -> 
	happyIn58
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_69 = happyReduce 10# 18# happyReduction_69
happyReduction_69 (happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut42 happy_x_1 of { happy_var_1 -> 
	case happyOut61 happy_x_3 of { happy_var_3 -> 
	case happyOut75 happy_x_5 of { happy_var_5 -> 
	case happyOut75 happy_x_7 of { happy_var_7 -> 
	case happyOut67 happy_x_10 of { happy_var_10 -> 
	happyIn59
		 (Process_spec happy_var_1 happy_var_3 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest}}}}}

happyReduce_70 = happySpecReduce_1  19# happyReduction_70
happyReduction_70 happy_x_1
	 =  case happyOut42 happy_x_1 of { happy_var_1 -> 
	happyIn60
		 (VName happy_var_1
	)}

happyReduce_71 = happySpecReduce_0  20# happyReduction_71
happyReduction_71  =  happyIn61
		 ([]
	)

happyReduce_72 = happySpecReduce_1  20# happyReduction_72
happyReduction_72 happy_x_1
	 =  case happyOut60 happy_x_1 of { happy_var_1 -> 
	happyIn61
		 ((:[]) happy_var_1
	)}

happyReduce_73 = happySpecReduce_3  20# happyReduction_73
happyReduction_73 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut60 happy_x_1 of { happy_var_1 -> 
	case happyOut61 happy_x_3 of { happy_var_3 -> 
	happyIn61
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_74 = happyReduce 5# 21# happyReduction_74
happyReduction_74 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut63 happy_x_4 of { happy_var_4 -> 
	happyIn62
		 (Functions happy_var_4
	) `HappyStk` happyRest}

happyReduce_75 = happySpecReduce_0  21# happyReduction_75
happyReduction_75  =  happyIn62
		 (Functions_none
	)

happyReduce_76 = happySpecReduce_0  22# happyReduction_76
happyReduction_76  =  happyIn63
		 ([]
	)

happyReduce_77 = happySpecReduce_1  22# happyReduction_77
happyReduction_77 happy_x_1
	 =  case happyOut64 happy_x_1 of { happy_var_1 -> 
	happyIn63
		 ((:[]) happy_var_1
	)}

happyReduce_78 = happySpecReduce_3  22# happyReduction_78
happyReduction_78 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut64 happy_x_1 of { happy_var_1 -> 
	case happyOut63 happy_x_3 of { happy_var_3 -> 
	happyIn63
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_79 = happyReduce 6# 23# happyReduction_79
happyReduction_79 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut42 happy_x_1 of { happy_var_1 -> 
	case happyOut61 happy_x_3 of { happy_var_3 -> 
	case happyOut67 happy_x_6 of { happy_var_6 -> 
	happyIn64
		 (Function_spec happy_var_1 happy_var_3 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_80 = happyReduce 4# 24# happyReduction_80
happyReduction_80 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut66 happy_x_2 of { happy_var_2 -> 
	case happyOut67 happy_x_4 of { happy_var_4 -> 
	happyIn65
		 (Start happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_81 = happyReduce 6# 25# happyReduction_81
happyReduction_81 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut75 happy_x_3 of { happy_var_3 -> 
	case happyOut75 happy_x_5 of { happy_var_5 -> 
	happyIn66
		 (Channel_specf happy_var_3 happy_var_5
	) `HappyStk` happyRest}}

happyReduce_82 = happyReduce 5# 25# happyReduction_82
happyReduction_82 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut81 happy_x_2 of { happy_var_2 -> 
	case happyOut81 happy_x_4 of { happy_var_4 -> 
	happyIn66
		 (Channel_spec happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_83 = happySpecReduce_3  26# happyReduction_83
happyReduction_83 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut68 happy_x_2 of { happy_var_2 -> 
	happyIn67
		 (Prog happy_var_2
	)}

happyReduce_84 = happySpecReduce_0  27# happyReduction_84
happyReduction_84  =  happyIn68
		 ([]
	)

happyReduce_85 = happySpecReduce_1  27# happyReduction_85
happyReduction_85 happy_x_1
	 =  case happyOut69 happy_x_1 of { happy_var_1 -> 
	happyIn68
		 ((:[]) happy_var_1
	)}

happyReduce_86 = happySpecReduce_3  27# happyReduction_86
happyReduction_86 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut69 happy_x_1 of { happy_var_1 -> 
	case happyOut68 happy_x_3 of { happy_var_3 -> 
	happyIn68
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_87 = happySpecReduce_2  28# happyReduction_87
happyReduction_87 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_2 of { happy_var_2 -> 
	happyIn69
		 (AC_STOREf happy_var_2
	)}

happyReduce_88 = happySpecReduce_2  28# happyReduction_88
happyReduction_88 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_2 of { happy_var_2 -> 
	happyIn69
		 (AC_LOADf happy_var_2
	)}

happyReduce_89 = happySpecReduce_1  28# happyReduction_89
happyReduction_89 happy_x_1
	 =  happyIn69
		 (AC_RET
	)

happyReduce_90 = happySpecReduce_1  28# happyReduction_90
happyReduction_90 happy_x_1
	 =  happyIn69
		 (AC_FRET
	)

happyReduce_91 = happyReduce 5# 28# happyReduction_91
happyReduction_91 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut42 happy_x_2 of { happy_var_2 -> 
	case happyOut75 happy_x_4 of { happy_var_4 -> 
	happyIn69
		 (AC_CALLf happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_92 = happySpecReduce_2  28# happyReduction_92
happyReduction_92 happy_x_2
	happy_x_1
	 =  case happyOut80 happy_x_2 of { happy_var_2 -> 
	happyIn69
		 (AC_INT happy_var_2
	)}

happyReduce_93 = happySpecReduce_1  28# happyReduction_93
happyReduction_93 happy_x_1
	 =  happyIn69
		 (AC_LEQ
	)

happyReduce_94 = happySpecReduce_1  28# happyReduction_94
happyReduction_94 happy_x_1
	 =  happyIn69
		 (AC_ADD
	)

happyReduce_95 = happySpecReduce_1  28# happyReduction_95
happyReduction_95 happy_x_1
	 =  happyIn69
		 (AC_MUL
	)

happyReduce_96 = happyReduce 6# 28# happyReduction_96
happyReduction_96 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut41 happy_x_3 of { happy_var_3 -> 
	case happyOut41 happy_x_5 of { happy_var_5 -> 
	happyIn69
		 (AC_CONS happy_var_3 happy_var_5
	) `HappyStk` happyRest}}

happyReduce_97 = happySpecReduce_3  28# happyReduction_97
happyReduction_97 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut43 happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_3 of { happy_var_3 -> 
	happyIn69
		 (AC_STRUCT happy_var_1 happy_var_3
	)}}

happyReduce_98 = happyReduce 6# 28# happyReduction_98
happyReduction_98 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut43 happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_3 of { happy_var_3 -> 
	case happyOut75 happy_x_5 of { happy_var_5 -> 
	happyIn69
		 (AC_STRUCTas happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_99 = happyReduce 5# 28# happyReduction_99
happyReduction_99 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut72 happy_x_4 of { happy_var_4 -> 
	happyIn69
		 (AC_CASEf happy_var_4
	) `HappyStk` happyRest}

happyReduce_100 = happyReduce 5# 28# happyReduction_100
happyReduction_100 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut72 happy_x_4 of { happy_var_4 -> 
	happyIn69
		 (AC_RECORDf happy_var_4
	) `HappyStk` happyRest}

happyReduce_101 = happySpecReduce_3  28# happyReduction_101
happyReduction_101 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut41 happy_x_2 of { happy_var_2 -> 
	case happyOut41 happy_x_3 of { happy_var_3 -> 
	happyIn69
		 (AC_DEST happy_var_2 happy_var_3
	)}}

happyReduce_102 = happySpecReduce_2  28# happyReduction_102
happyReduction_102 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_2 of { happy_var_2 -> 
	happyIn69
		 (AC_GETf happy_var_2
	)}

happyReduce_103 = happyReduce 5# 28# happyReduction_103
happyReduction_103 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut42 happy_x_2 of { happy_var_2 -> 
	case happyOut43 happy_x_3 of { happy_var_3 -> 
	case happyOut43 happy_x_5 of { happy_var_5 -> 
	happyIn69
		 (AC_HPUTf happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_104 = happyReduce 6# 28# happyReduction_104
happyReduction_104 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut42 happy_x_2 of { happy_var_2 -> 
	case happyOut72 happy_x_5 of { happy_var_5 -> 
	happyIn69
		 (AC_HCASEf happy_var_2 happy_var_5
	) `HappyStk` happyRest}}

happyReduce_105 = happySpecReduce_2  28# happyReduction_105
happyReduction_105 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_2 of { happy_var_2 -> 
	happyIn69
		 (AC_PUTf happy_var_2
	)}

happyReduce_106 = happyReduce 5# 28# happyReduction_106
happyReduction_106 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut42 happy_x_2 of { happy_var_2 -> 
	case happyOut42 happy_x_4 of { happy_var_4 -> 
	case happyOut42 happy_x_5 of { happy_var_5 -> 
	happyIn69
		 (AC_SPLITf happy_var_2 happy_var_4 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_107 = happyReduce 16# 28# happyReduction_107
happyReduction_107 (happy_x_16 `HappyStk`
	happy_x_15 `HappyStk`
	happy_x_14 `HappyStk`
	happy_x_13 `HappyStk`
	happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut42 happy_x_2 of { happy_var_2 -> 
	case happyOut42 happy_x_5 of { happy_var_5 -> 
	case happyOut75 happy_x_7 of { happy_var_7 -> 
	case happyOut67 happy_x_9 of { happy_var_9 -> 
	case happyOut42 happy_x_11 of { happy_var_11 -> 
	case happyOut75 happy_x_13 of { happy_var_13 -> 
	case happyOut67 happy_x_15 of { happy_var_15 -> 
	happyIn69
		 (AC_FORKf happy_var_2 happy_var_5 happy_var_7 happy_var_9 happy_var_11 happy_var_13 happy_var_15
	) `HappyStk` happyRest}}}}}}}

happyReduce_108 = happyReduce 16# 28# happyReduction_108
happyReduction_108 (happy_x_16 `HappyStk`
	happy_x_15 `HappyStk`
	happy_x_14 `HappyStk`
	happy_x_13 `HappyStk`
	happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut42 happy_x_2 of { happy_var_2 -> 
	case happyOut75 happy_x_6 of { happy_var_6 -> 
	case happyOut67 happy_x_9 of { happy_var_9 -> 
	case happyOut75 happy_x_12 of { happy_var_12 -> 
	case happyOut67 happy_x_15 of { happy_var_15 -> 
	happyIn69
		 (AC_PLUGf happy_var_2 happy_var_6 happy_var_9 happy_var_12 happy_var_15
	) `HappyStk` happyRest}}}}}

happyReduce_109 = happyReduce 9# 28# happyReduction_109
happyReduction_109 (happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut42 happy_x_2 of { happy_var_2 -> 
	case happyOut75 happy_x_4 of { happy_var_4 -> 
	case happyOut75 happy_x_6 of { happy_var_6 -> 
	case happyOut75 happy_x_8 of { happy_var_8 -> 
	happyIn69
		 (AC_RUNf happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest}}}}

happyReduce_110 = happySpecReduce_3  28# happyReduction_110
happyReduction_110 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_1 of { happy_var_1 -> 
	case happyOut42 happy_x_3 of { happy_var_3 -> 
	happyIn69
		 (AC_IDF happy_var_1 happy_var_3
	)}}

happyReduce_111 = happySpecReduce_2  28# happyReduction_111
happyReduction_111 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_2 of { happy_var_2 -> 
	happyIn69
		 (AC_CLOSEf happy_var_2
	)}

happyReduce_112 = happySpecReduce_2  28# happyReduction_112
happyReduction_112 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_2 of { happy_var_2 -> 
	happyIn69
		 (AC_HALTf happy_var_2
	)}

happyReduce_113 = happyReduce 5# 29# happyReduction_113
happyReduction_113 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut43 happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_3 of { happy_var_3 -> 
	case happyOut67 happy_x_5 of { happy_var_5 -> 
	happyIn70
		 (Labelcoms1 happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_114 = happyReduce 8# 29# happyReduction_114
happyReduction_114 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut43 happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_3 of { happy_var_3 -> 
	case happyOut75 happy_x_5 of { happy_var_5 -> 
	case happyOut67 happy_x_8 of { happy_var_8 -> 
	happyIn70
		 (Labelcoms2 happy_var_1 happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest}}}}

happyReduce_115 = happySpecReduce_0  30# happyReduction_115
happyReduction_115  =  happyIn71
		 ([]
	)

happyReduce_116 = happySpecReduce_1  30# happyReduction_116
happyReduction_116 happy_x_1
	 =  case happyOut67 happy_x_1 of { happy_var_1 -> 
	happyIn71
		 ((:[]) happy_var_1
	)}

happyReduce_117 = happySpecReduce_3  30# happyReduction_117
happyReduction_117 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut67 happy_x_1 of { happy_var_1 -> 
	case happyOut71 happy_x_3 of { happy_var_3 -> 
	happyIn71
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_118 = happySpecReduce_0  31# happyReduction_118
happyReduction_118  =  happyIn72
		 ([]
	)

happyReduce_119 = happySpecReduce_1  31# happyReduction_119
happyReduction_119 happy_x_1
	 =  case happyOut70 happy_x_1 of { happy_var_1 -> 
	happyIn72
		 ((:[]) happy_var_1
	)}

happyReduce_120 = happySpecReduce_3  31# happyReduction_120
happyReduction_120 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut70 happy_x_1 of { happy_var_1 -> 
	case happyOut72 happy_x_3 of { happy_var_3 -> 
	happyIn72
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_121 = happySpecReduce_1  32# happyReduction_121
happyReduction_121 happy_x_1
	 =  case happyOut78 happy_x_1 of { happy_var_1 -> 
	happyIn73
		 ((:[]) happy_var_1
	)}

happyReduce_122 = happySpecReduce_3  32# happyReduction_122
happyReduction_122 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut78 happy_x_1 of { happy_var_1 -> 
	case happyOut73 happy_x_3 of { happy_var_3 -> 
	happyIn73
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_123 = happySpecReduce_1  33# happyReduction_123
happyReduction_123 happy_x_1
	 =  case happyOut79 happy_x_1 of { happy_var_1 -> 
	happyIn74
		 ((:[]) happy_var_1
	)}

happyReduce_124 = happySpecReduce_3  33# happyReduction_124
happyReduction_124 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut79 happy_x_1 of { happy_var_1 -> 
	case happyOut74 happy_x_3 of { happy_var_3 -> 
	happyIn74
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_125 = happySpecReduce_0  34# happyReduction_125
happyReduction_125  =  happyIn75
		 ([]
	)

happyReduce_126 = happySpecReduce_1  34# happyReduction_126
happyReduction_126 happy_x_1
	 =  case happyOut42 happy_x_1 of { happy_var_1 -> 
	happyIn75
		 ((:[]) happy_var_1
	)}

happyReduce_127 = happySpecReduce_3  34# happyReduction_127
happyReduction_127 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_1 of { happy_var_1 -> 
	case happyOut75 happy_x_3 of { happy_var_3 -> 
	happyIn75
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_128 = happySpecReduce_0  35# happyReduction_128
happyReduction_128  =  happyIn76
		 ([]
	)

happyReduce_129 = happySpecReduce_1  35# happyReduction_129
happyReduction_129 happy_x_1
	 =  case happyOut77 happy_x_1 of { happy_var_1 -> 
	happyIn76
		 ((:[]) happy_var_1
	)}

happyReduce_130 = happySpecReduce_3  35# happyReduction_130
happyReduction_130 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut77 happy_x_1 of { happy_var_1 -> 
	case happyOut76 happy_x_3 of { happy_var_3 -> 
	happyIn76
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_131 = happySpecReduce_0  35# happyReduction_131
happyReduction_131  =  happyIn76
		 ([]
	)

happyReduce_132 = happySpecReduce_1  35# happyReduction_132
happyReduction_132 happy_x_1
	 =  case happyOut77 happy_x_1 of { happy_var_1 -> 
	happyIn76
		 ((:[]) happy_var_1
	)}

happyReduce_133 = happySpecReduce_3  35# happyReduction_133
happyReduction_133 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut77 happy_x_1 of { happy_var_1 -> 
	case happyOut76 happy_x_3 of { happy_var_3 -> 
	happyIn76
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_134 = happyReduce 7# 36# happyReduction_134
happyReduction_134 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut41 happy_x_2 of { happy_var_2 -> 
	case happyOut41 happy_x_6 of { happy_var_6 -> 
	happyIn77
		 (TranIn11 happy_var_2 happy_var_6
	) `HappyStk` happyRest}}

happyReduce_135 = happyReduce 7# 36# happyReduction_135
happyReduction_135 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut41 happy_x_2 of { happy_var_2 -> 
	case happyOut41 happy_x_6 of { happy_var_6 -> 
	happyIn77
		 (TranIn12 happy_var_2 happy_var_6
	) `HappyStk` happyRest}}

happyReduce_136 = happySpecReduce_1  37# happyReduction_136
happyReduction_136 happy_x_1
	 =  case happyOut80 happy_x_1 of { happy_var_1 -> 
	happyIn78
		 (Ncinteger happy_var_1
	)}

happyReduce_137 = happySpecReduce_1  38# happyReduction_137
happyReduction_137 happy_x_1
	 =  case happyOut42 happy_x_1 of { happy_var_1 -> 
	happyIn79
		 (Nident1 happy_var_1
	)}

happyReduce_138 = happySpecReduce_1  39# happyReduction_138
happyReduction_138 happy_x_1
	 =  case happyOut41 happy_x_1 of { happy_var_1 -> 
	happyIn80
		 (Positive happy_var_1
	)}

happyReduce_139 = happySpecReduce_2  39# happyReduction_139
happyReduction_139 happy_x_2
	happy_x_1
	 =  case happyOut41 happy_x_2 of { happy_var_2 -> 
	happyIn80
		 (Negative happy_var_2
	)}

happyReduce_140 = happySpecReduce_0  40# happyReduction_140
happyReduction_140  =  happyIn81
		 ([]
	)

happyReduce_141 = happySpecReduce_1  40# happyReduction_141
happyReduction_141 happy_x_1
	 =  case happyOut80 happy_x_1 of { happy_var_1 -> 
	happyIn81
		 ((:[]) happy_var_1
	)}

happyReduce_142 = happySpecReduce_3  40# happyReduction_142
happyReduction_142 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut80 happy_x_1 of { happy_var_1 -> 
	case happyOut81 happy_x_3 of { happy_var_3 -> 
	happyIn81
		 ((:) happy_var_1 happy_var_3
	)}}

happyNewToken action sts stk [] =
	happyDoAction 56# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TS _ 20) -> cont 20#;
	PT _ (TS _ 21) -> cont 21#;
	PT _ (TS _ 22) -> cont 22#;
	PT _ (TS _ 23) -> cont 23#;
	PT _ (TS _ 24) -> cont 24#;
	PT _ (TS _ 25) -> cont 25#;
	PT _ (TS _ 26) -> cont 26#;
	PT _ (TS _ 27) -> cont 27#;
	PT _ (TS _ 28) -> cont 28#;
	PT _ (TS _ 29) -> cont 29#;
	PT _ (TS _ 30) -> cont 30#;
	PT _ (TS _ 31) -> cont 31#;
	PT _ (TS _ 32) -> cont 32#;
	PT _ (TS _ 33) -> cont 33#;
	PT _ (TS _ 34) -> cont 34#;
	PT _ (TS _ 35) -> cont 35#;
	PT _ (TS _ 36) -> cont 36#;
	PT _ (TS _ 37) -> cont 37#;
	PT _ (TS _ 38) -> cont 38#;
	PT _ (TS _ 39) -> cont 39#;
	PT _ (TS _ 40) -> cont 40#;
	PT _ (TS _ 41) -> cont 41#;
	PT _ (TS _ 42) -> cont 42#;
	PT _ (TS _ 43) -> cont 43#;
	PT _ (TS _ 44) -> cont 44#;
	PT _ (TS _ 45) -> cont 45#;
	PT _ (TS _ 46) -> cont 46#;
	PT _ (TS _ 47) -> cont 47#;
	PT _ (TS _ 48) -> cont 48#;
	PT _ (TS _ 49) -> cont 49#;
	PT _ (TS _ 50) -> cont 50#;
	PT _ (TS _ 51) -> cont 51#;
	PT _ (TI happy_dollar_dollar) -> cont 52#;
	PT _ (TV happy_dollar_dollar) -> cont 53#;
	PT _ (T_UIdent happy_dollar_dollar) -> cont 54#;
	_ -> cont 55#;
	_ -> happyError' (tk:tks)
	}

happyError_ 56# tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => [(Token)] -> Err a
happyError' = happyError

pAMPLCODE tks = happySomeParser where
  happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (happyOut44 x))

pHANDLE_SPEC tks = happySomeParser where
  happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (happyOut45 x))

pHandle tks = happySomeParser where
  happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (happyOut46 x))

pListHANDLE_SPEC tks = happySomeParser where
  happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (happyOut47 x))

pListHandle tks = happySomeParser where
  happySomeParser = happyThen (happyParse 4# tks) (\x -> happyReturn (happyOut48 x))

pCONSTRUCTORS tks = happySomeParser where
  happySomeParser = happyThen (happyParse 5# tks) (\x -> happyReturn (happyOut49 x))

pDESTRUCTORS tks = happySomeParser where
  happySomeParser = happyThen (happyParse 6# tks) (\x -> happyReturn (happyOut50 x))

pSTRUCTOR_SPEC tks = happySomeParser where
  happySomeParser = happyThen (happyParse 7# tks) (\x -> happyReturn (happyOut51 x))

pSTRUCT tks = happySomeParser where
  happySomeParser = happyThen (happyParse 8# tks) (\x -> happyReturn (happyOut52 x))

pListSTRUCTOR_SPEC tks = happySomeParser where
  happySomeParser = happyThen (happyParse 9# tks) (\x -> happyReturn (happyOut53 x))

pListSTRUCT tks = happySomeParser where
  happySomeParser = happyThen (happyParse 10# tks) (\x -> happyReturn (happyOut54 x))

pHANDLES tks = happySomeParser where
  happySomeParser = happyThen (happyParse 11# tks) (\x -> happyReturn (happyOut55 x))

pCOHANDLES tks = happySomeParser where
  happySomeParser = happyThen (happyParse 12# tks) (\x -> happyReturn (happyOut56 x))

pPROCESSES tks = happySomeParser where
  happySomeParser = happyThen (happyParse 13# tks) (\x -> happyReturn (happyOut57 x))

pListPROCESS_SPEC tks = happySomeParser where
  happySomeParser = happyThen (happyParse 14# tks) (\x -> happyReturn (happyOut58 x))

pPROCESS_SPEC tks = happySomeParser where
  happySomeParser = happyThen (happyParse 15# tks) (\x -> happyReturn (happyOut59 x))

pVars tks = happySomeParser where
  happySomeParser = happyThen (happyParse 16# tks) (\x -> happyReturn (happyOut60 x))

pListVars tks = happySomeParser where
  happySomeParser = happyThen (happyParse 17# tks) (\x -> happyReturn (happyOut61 x))

pFUNCTIONS tks = happySomeParser where
  happySomeParser = happyThen (happyParse 18# tks) (\x -> happyReturn (happyOut62 x))

pListFUNCTION_SPEC tks = happySomeParser where
  happySomeParser = happyThen (happyParse 19# tks) (\x -> happyReturn (happyOut63 x))

pFUNCTION_SPEC tks = happySomeParser where
  happySomeParser = happyThen (happyParse 20# tks) (\x -> happyReturn (happyOut64 x))

pSTART tks = happySomeParser where
  happySomeParser = happyThen (happyParse 21# tks) (\x -> happyReturn (happyOut65 x))

pCHANNEL_SPEC tks = happySomeParser where
  happySomeParser = happyThen (happyParse 22# tks) (\x -> happyReturn (happyOut66 x))

pCOMS tks = happySomeParser where
  happySomeParser = happyThen (happyParse 23# tks) (\x -> happyReturn (happyOut67 x))

pListCOM tks = happySomeParser where
  happySomeParser = happyThen (happyParse 24# tks) (\x -> happyReturn (happyOut68 x))

pCOM tks = happySomeParser where
  happySomeParser = happyThen (happyParse 25# tks) (\x -> happyReturn (happyOut69 x))

pLABELCOMS tks = happySomeParser where
  happySomeParser = happyThen (happyParse 26# tks) (\x -> happyReturn (happyOut70 x))

pListCOMS tks = happySomeParser where
  happySomeParser = happyThen (happyParse 27# tks) (\x -> happyReturn (happyOut71 x))

pListLABELCOMS tks = happySomeParser where
  happySomeParser = happyThen (happyParse 28# tks) (\x -> happyReturn (happyOut72 x))

pListNCInteger tks = happySomeParser where
  happySomeParser = happyThen (happyParse 29# tks) (\x -> happyReturn (happyOut73 x))

pListNIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse 30# tks) (\x -> happyReturn (happyOut74 x))

pListIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse 31# tks) (\x -> happyReturn (happyOut75 x))

pListTRAN tks = happySomeParser where
  happySomeParser = happyThen (happyParse 32# tks) (\x -> happyReturn (happyOut76 x))

pTRAN tks = happySomeParser where
  happySomeParser = happyThen (happyParse 33# tks) (\x -> happyReturn (happyOut77 x))

pNCInteger tks = happySomeParser where
  happySomeParser = happyThen (happyParse 34# tks) (\x -> happyReturn (happyOut78 x))

pNIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse 35# tks) (\x -> happyReturn (happyOut79 x))

pCInteger tks = happySomeParser where
  happySomeParser = happyThen (happyParse 36# tks) (\x -> happyReturn (happyOut80 x))

pListCInteger tks = happySomeParser where
  happySomeParser = happyThen (happyParse 37# tks) (\x -> happyReturn (happyOut81 x))

happySeq = happyDontSeq


returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    _ -> " before " ++ unwords (map (id . prToken) (take 4 ts))

myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














# 1 "/usr/include/x86_64-linux-gnu/bits/predefs.h" 1 3 4

# 18 "/usr/include/x86_64-linux-gnu/bits/predefs.h" 3 4












# 31 "/usr/include/stdc-predef.h" 2 3 4








# 8 "<command-line>" 2
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}





#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 45 "templates/GenericTemplate.hs" #-}


data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList





{-# LINE 66 "templates/GenericTemplate.hs" #-}

{-# LINE 76 "templates/GenericTemplate.hs" #-}

{-# LINE 85 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	(happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
	= {- nothing -}


	  case action of
		0#		  -> {- nothing -}
				     happyFail i tk st
		-1# 	  -> {- nothing -}
				     happyAccept i tk st
		n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

				     (happyReduceArr Happy_Data_Array.! rule) i tk st
				     where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
		n		  -> {- nothing -}


				     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = indexShortOffAddr happyActOffsets st
         off_i  = (off Happy_GHC_Exts.+# i)
	 check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
		  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st


indexShortOffAddr (HappyA# arr) off =
	Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#





data HappyAddr = HappyA# Happy_GHC_Exts.Addr#




-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 169 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
	 sts1@((HappyCons (st1@(action)) (_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = indexShortOffAddr happyGotoOffsets st1
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i



          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = indexShortOffAddr happyGotoOffsets st
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (action) sts stk =
--      trace "entering error recovery" $
	happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
