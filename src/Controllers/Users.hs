{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controllers.Users (controller, API) where

import qualified Models.User as Models
import Servant
import State (AppM)

type API =
    Summary "Get Users"
        :> Description "Returns a list of users"
        :> Get '[JSON] [Models.User]

controller :: ServerT API AppM
controller = users

users :: AppM [Models.User]
users =
    pure
        [ Models.User 1 "Isaac" "Newton"
        , Models.User 2 "Albert" "Einstein"
        ]
