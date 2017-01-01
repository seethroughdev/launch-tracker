module Launches.Edit exposing (..)

import Html exposing (..)


-- import Html.Attributes exposing (class, value, href)

import Html.Events exposing (onClick)
import Launches.Messages exposing (..)
import Launches.Models exposing (..)


view : Launch -> Html.Html Msg
view model =
    div []
        [ h1 [] [ text "Edit page" ]
        , button [ onClick ShowLaunches ] [ text "Show Launches" ]
        ]
