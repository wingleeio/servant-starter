{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators #-}

module Models.User (User (..)) where

import Control.Lens
import Data.Aeson
import Data.Aeson.TH
import Data.OpenApi
import GHC.Generics (Generic)

data User = User
    { id :: Int
    , name :: String
    , lastName :: String
    }
    deriving (Eq, Show, Generic)

$(deriveJSON defaultOptions ''User)

instance ToSchema User where
    declareNamedSchema proxy =
        genericDeclareNamedSchema defaultSchemaOptions proxy
            & mapped . schema . description ?~ "Represents a user"
            & mapped . schema . example ?~ toJSON (User 1 "John" "Doe")