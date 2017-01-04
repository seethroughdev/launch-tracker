module Launches.Views.LaunchesMenu exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Launches.Models exposing (..)
import Launches.Messages exposing (Msg(..))


renderMain : Launch -> Html Msg
renderMain launch =
    div []
        [ h4 [] [ text "Main" ]
        , p [] [ text "This is the main" ]
        ]


renderAgencies : Launch -> Html Msg
renderAgencies launch =
    div []
        [ h4 [] [ text "Agencies" ]
        , p [] [ text "This is the agencies" ]
        ]


renderRocket : Launch -> Html Msg
renderRocket launch =
    div []
        [ h4 [] [ text "Rocket" ]
        , p [] [ text "This is the rocket" ]
        ]


renderLocation : Launch -> Html Msg
renderLocation launch =
    div []
        [ h4 [] [ text "Location" ]
        , p [] [ text "This is the location" ]
        ]


renderContainer : LaunchMenu -> Launch -> Html Msg
renderContainer launchMenu launch =
    case launchMenu of
        Main ->
            renderMain launch

        Agencies ->
            renderAgencies launch

        Rocket ->
            renderRocket launch

        Location ->
            renderLocation launch


renderNav : Html Msg
renderNav =
    ul []
        [ li [ onClick (ChangeMenu Main) ] [ text "Main" ]
        , li [ onClick (ChangeMenu Agencies) ] [ text "Agencies" ]
        , li [ onClick (ChangeMenu Rocket) ] [ text "Rocket" ]
        , li [ onClick (ChangeMenu Location) ] [ text "Location" ]
        ]


view : LaunchMenu -> Launch -> Html Msg
view menu launch =
    div []
        [ renderNav
        , renderContainer menu launch
        ]
