{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Routes (Routes, routes) where

import qualified Controllers.Posts as Posts
import qualified Controllers.Users as Users
import Servant
import State (AppM)

type Routes = "users" :> Users.API :<|> "posts" :> Posts.API

routes :: ServerT Routes AppM
routes = Users.controller :<|> Posts.controller