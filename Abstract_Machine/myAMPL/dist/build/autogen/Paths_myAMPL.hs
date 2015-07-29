module Paths_myAMPL (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/prashant/.cabal/bin"
libdir     = "/home/prashant/.cabal/lib/myAMPL-0.1.0.0/ghc-7.6.3"
datadir    = "/home/prashant/.cabal/share/myAMPL-0.1.0.0"
libexecdir = "/home/prashant/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "myAMPL_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myAMPL_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "myAMPL_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myAMPL_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
