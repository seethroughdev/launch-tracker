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
            (List.map listLaunch launches.data)
        ]


renderLaunch : Launch -> Html Msg
renderLaunch launch =
    div []
        [ h4 [] [ text "Launch" ]
        , h1 [] [ text launch.name ]
        , text (toString launch)
        ]


renderNoLaunch : Html Msg
renderNoLaunch =
    div []
        [ text "That launch no longer exists, try another"
        ]


launchView : Launches -> Html Msg
launchView launches =
    case launches.currentLaunch of
        Just value ->
            let
                d =
                    launches.data
                        |> List.filter (\u -> u.id == value)
                        |> List.head
            in
                case d of
                    Just value ->
                        renderLaunch value

                    Nothing ->
                        renderNoLaunch

        Nothing ->
            div []
                [ text "Loading Launch"
                ]


view : Launches -> Html Msg
view model =
    div [ class "mainContainer" ]
        [ listView model
        , main_ [ class "main" ]
            [ launchView model
            ]
        ]
