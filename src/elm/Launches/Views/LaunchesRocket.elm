module Launches.Views.LaunchesRocket exposing (..)

import Html exposing (..)
import Launches.Models exposing (Launch)


view : Launch -> Html msg
view launch =
    div []
        [ h1 [] [ text launch.name ]
        , p [] [ text (toString launch.rocket) ]
        ]
