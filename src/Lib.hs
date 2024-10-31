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
import Servant hiding (Context)
import State
import System.Environment (lookupEnv)

type API = Routes :<|> "documentation" :> Documentation.API

startApp :: IO ()
startApp = do
    env <- lookupEnv "ENV"
    let context = Context {isDevelopment = env == Just "development"}
    run 8080 (app context)

app :: Context -> Application
app context = serve api (hoistServer api (nt context) server)

api :: Proxy API
api = Proxy

server :: ServerT API AppM
server = routes :<|> Documentation.controller
