{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controllers.Posts (controller, API) where

import qualified Models.Post as Models
import Servant
import State (AppM)

type API =
    Summary "Get Posts"
        :> Description "Returns a list of posts"
        :> Get '[JSON] [Models.Post]

controller :: ServerT API AppM
controller = posts

posts :: AppM [Models.Post]
posts =
    pure
        [ Models.Post 1 "Hello, World!"
        , Models.Post 2 "Goodbye, World!"
        ]
