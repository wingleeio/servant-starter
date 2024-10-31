{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controllers.Posts (controller, API) where

import qualified Models.Post as Models
import Servant

type API =
    Summary "Get Posts"
        :> Description "Returns a list of posts"
        :> Get '[JSON] [Models.Post]

controller :: Server API
controller = return posts

posts :: [Models.Post]
posts =
    [ Models.Post 1 "Hello, World!"
    , Models.Post 2 "Goodbye, World!"
    ]
