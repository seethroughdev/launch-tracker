module Launches.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Launches.Messages exposing (Msg(..))
import Launches.Models exposing (Launches, Launch)


listLaunch : Launch -> Html Msg
listLaunch launch =
    li []
        [ h4 [] [ text launch.name ]
        , p [] [ text launch.location.name ]
        , p [] [ text launch.date ]
        ]


listView : Launches -> Html Msg
listView launches =
    aside [ class "aside" ]
        [ h3 [] [ text "Upcoming Launches" ]
        , ul []
            (List.map listLaunch launches)
        ]


renderLaunch : Launch -> Html Msg
renderLaunch launch =
    div []
        [ h4 [] [ text "Launch" ]
        , h1 [] [ text launch.name ]
        , text (toString launch)
        ]


launchView : Maybe Launch -> Html Msg
launchView launch =
    case launch of
        Just value ->
            renderLaunch value

        Nothing ->
            div []
                [ text "Loading Launch"
                ]


view : Launches -> Maybe Launch -> Html Msg
view launches launch =
    div [ class "mainContainer" ]
        [ listView launches
        , main_ [ class "main" ]
            [ launchView launch
            ]
        ]
