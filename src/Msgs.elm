module Msgs exposing (..)

import Models exposing (Route(..), Resource(..))

type Msg
    = NoOp
    | ChangeRoute Route
    | FetchData Resource