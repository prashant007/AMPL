module Semantics.Terminal where
import Network
import Control.Concurrent
import System.IO
import Text.Printf
import Control.Monad
import Data.IORef
import Control.Concurrent.STM.TChan
import Control.Monad.STM
import System.Cmd

 

server socket  = do
    (handle, host, port) <- accept socket
    m <- newEmptyMVar
    line <- hGetLine handle
    forkIO $ do putMVar m line
    r <- takeMVar m
    -- takeMVar
    return r  

communicateT :: PortNumber -> IO String
communicateT portnum  = do
    sock <- listenOn $ PortNumber portnum
    (h,host,po) <- accept sock
    line <- hGetLine h
    putStrLn $ "The entered number is " ++ line
    hClose h
    sClose sock
    return line

communicate portnum = do
    a <- atomically $ newTChan
    -- a :: TChan a
    forkIO $ do
        msg <- communicateT portnum
        atomically $ writeTChan a msg
    b <- atomically $ readTChan a
    return b