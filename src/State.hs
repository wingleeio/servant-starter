module State
    ( Context (..)
    , AppM
    , nt
    )
where

import Control.Monad.Trans.Reader (ReaderT, runReaderT)
import Servant (Handler)

newtype Context = Context
    { isDevelopment :: Bool
    }

type AppM = ReaderT Context Handler

nt :: Context -> AppM a -> Handler a
nt state x = runReaderT x state