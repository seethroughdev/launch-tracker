module Launches.View exposing (..)

import Html exposing (..)
import Launches.Messages exposing (Msg(..))
import Launches.Models exposing (Launches, Launch)


listLaunch : Launch -> Html Msg
listLaunch launch =
    li []
        [ text launch.name
        ]


listView : Launches -> Html Msg
listView launches =
    div []
        [ h3 [] [ text "Launchessss" ]
        , ul []
            (List.map listLaunch launches)
        ]
