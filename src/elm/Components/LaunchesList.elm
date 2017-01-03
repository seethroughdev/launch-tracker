module Components.LaunchesList exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Components.DateHelpers as DateHelpers
import Launches.Models exposing (Launches, Launch, LaunchId)
import Launches.Messages exposing (Msg(..))


view : Launch -> Html Msg
view launch =
    li [ onClick (ShowLaunch launch.id) ]
        [ h4 [] [ text launch.name ]
        , p [] [ text launch.location.name ]
        , p [] [ DateHelpers.launchDate launch.isoStart ]
        , p [] [ text (toString launch.id) ]
        ]
