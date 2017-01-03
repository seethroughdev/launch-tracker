module Launches.Views.LaunchesMenu exposing (view)

import Html exposing (..)
import Launches.Models exposing (Launch, LaunchMenu)
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


renderContainer : Launch -> LaunchMenu -> Html Msg
renderContainer launch launchMenu =
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
        [ li [] [ text "Main" ]
        , li [] [ text "Agencies" ]
        , li [] [ text "Rocket" ]
        , li [] [ text "Location" ]
        ]


view : Launch -> Html Msg
view launch =
    div []
        [ renderNav
        , renderMain launch
        ]
