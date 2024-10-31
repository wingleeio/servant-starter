{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module Controllers.Documentation (controller, API) where

import Control.Lens

import Data.OpenApi hiding (Server)
import Routes (Routes)
import Servant (Get, HasServer (ServerT), JSON, Proxy (Proxy), (:<|>) (..), (:>))
import Servant.HTML.Blaze (HTML)
import Servant.OpenApi
import State (AppM)
import Text.Blaze.Html5 (Html)
import qualified Views.Scalar as Scalar

type API =
    Get '[HTML] Html
        :<|> "swagger.json" :> Get '[JSON] OpenApi

controller :: ServerT API AppM
controller = documentation :<|> swagger

api :: Proxy Routes
api = Proxy

documentation :: AppM Html
documentation = pure Scalar.view

swagger :: AppM OpenApi
swagger =
    pure $
        toOpenApi api
            & info . title .~ "Servant Starter API"
            & info . version .~ "1.0"
            & info . description ?~ "This is an API built with Haskell and Servent"
            & info . license ?~ ("MIT" & url ?~ URL "https://servant-starter.com")