module Launches.List exposing (..)

import Html exposing (..)


-- import Html.Attributes exposing (class)

import Html.Events exposing (onClick)
import Launches.Messages exposing (..)
import Launches.Models exposing (Launches)


view : Launches -> Html Msg
view model =
    div []
        [ h1 [] [ text "Launches page" ]
        , button [ onClick (ShowLaunch 879) ] [ text "Show Launches" ]
        ]
