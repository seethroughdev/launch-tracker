module Launches.View exposing (..)

import Html exposing (..)
import Launches.Messages exposing (Msg(..))
import Launches.Models exposing (Launches)


listView : Launches -> Html Msg
listView launches =
    div []
        [ h3 [] [ text "Launches" ]
        ]
