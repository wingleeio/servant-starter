{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controllers.Users (controller, API) where

import qualified Models.User as Models
import Servant

type API =
    Summary "Get Users"
        :> Description "Returns a list of users"
        :> Get '[JSON] [Models.User]

controller :: Server API
controller = return users

users :: [Models.User]
users =
    [ Models.User 1 "Isaac" "Newton"
    , Models.User 2 "Albert" "Einstein"
    ]
