{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module Controllers.Documentation (controller, API) where

import Control.Lens

import Data.OpenApi hiding (Server)
import Routes (Routes)
import Servant (Get, JSON, Proxy (Proxy), Server, (:<|>) (..), (:>))
import Servant.HTML.Blaze (HTML)
import Servant.OpenApi
import Text.Blaze.Html5 (Html)
import qualified Views.Scalar as Scalar

type API =
    Get '[HTML] Html
        :<|> "swagger.json" :> Get '[JSON] OpenApi

controller :: Server API
controller = scalarHandler :<|> swaggerHandler
  where
    scalarHandler = return Scalar.view
    swaggerHandler = return swagger

api :: Proxy Routes
api = Proxy

swagger :: OpenApi
swagger =
    toOpenApi api
        & info . title .~ "Servant Starter API"
        & info . version .~ "1.0"
        & info . description ?~ "This is an API built with Haskell and Servent"
        & info . license ?~ ("MIT" & url ?~ URL "https://servant-starter.com")