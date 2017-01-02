module Launches.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Launches.Messages exposing (Msg(..))
import Launches.Models exposing (Launches, Launch, LaunchId)
import RemoteData exposing (..)
import Components.ViewHelpers as ViewHelpers


itemView : Maybe Launch -> Html Msg
itemView launch =
    case launch of
        Nothing ->
            div [] [ text "No active launch" ]

        Just l ->
            div []
                [ h3 [] [ text (toString launch) ]
                ]


listItemView : Launch -> Html Msg
listItemView launch =
    li [ onClick (ShowLaunch launch.id) ]
        [ h4 [] [ text launch.name ]
        , p [] [ text launch.location.name ]
        , p [] [ ViewHelpers.renderLaunchDate launch.isoStart ]
        , p [] [ text (toString launch.id) ]
        ]


launchView : Launches -> Maybe Launch -> Html Msg
launchView model launch =
    case model.data of
        NotAsked ->
            div [] []

        Loading ->
            div [] [ text "Loading" ]

        Failure e ->
            div [] [ text "No Launches, must be an error" ]

        Success data ->
            itemView launch


listView : Launches -> List (Html Msg)
listView model =
    case model.data of
        NotAsked ->
            [ li [] []
            ]

        Loading ->
            [ li [] [ text "Loading" ]
            ]

        Failure e ->
            [ li [] [ text "No Launches, must be an error" ]
            ]

        Success data ->
            (List.map listItemView data)


view : Launches -> Maybe Launch -> Html Msg
view model launch =
    div [ class "mainContainer" ]
        [ aside [ class "aside" ]
            [ h3 [] [ text "Upcoming Launches" ]
            , ul []
                (listView model)
            ]
        , main_ [ class "main" ]
            [ div
                []
                [ h4 [] [ text "Launch" ]
                , (launchView model launch)
                ]
            ]
        ]
