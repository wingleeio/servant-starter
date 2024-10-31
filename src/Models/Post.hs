{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators #-}

module Models.Post (Post (..)) where

import Control.Lens
import Data.Aeson
import Data.Aeson.TH
import Data.OpenApi
import GHC.Generics (Generic)

data Post = Post
    { id :: Int
    , content :: String
    }
    deriving (Eq, Show, Generic)

$(deriveJSON defaultOptions ''Post)

instance ToSchema Post where
    declareNamedSchema proxy =
        genericDeclareNamedSchema defaultSchemaOptions proxy
            & mapped . schema . description ?~ "Represents a post"
            & mapped . schema . example ?~ toJSON (Post 1 "Hello, World!")