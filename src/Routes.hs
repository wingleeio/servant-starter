{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Routes (Routes, routes) where

import qualified Controllers.Posts as Posts
import qualified Controllers.Users as Users
import Servant

type Routes = "users" :> Users.API :<|> "posts" :> Posts.API

routes :: Server Routes
routes = Users.controller :<|> Posts.controller