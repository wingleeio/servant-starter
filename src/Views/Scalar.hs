{-# LANGUAGE OverloadedStrings #-}

module Views.Scalar (view) where

import Text.Blaze.Html5 (Html, (!))
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

view :: Html
view = H.docTypeHtml $ do
    H.head $ do
        H.title "Scalar API Reference"
    H.body $ do
        H.script ! A.id "api-reference" ! H.customAttribute "data-url" "/documentation/swagger.json" $ ""
        H.script ! A.src "https://cdn.jsdelivr.net/npm/@scalar/api-reference" $ ""