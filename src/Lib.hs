{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Lib
    ( startApp
    , app
    ) where

import qualified Controllers.Documentation as Documentation

import Network.Wai
import Network.Wai.Handler.Warp
import Routes (Routes, routes)
import Servant

type API = Routes :<|> "documentation" :> Documentation.API

startApp :: IO ()
startApp = run 8080 app

app :: Application
app = serve api server

api :: Proxy API
api = Proxy

server :: Server API
server = routes :<|> Documentation.controller
