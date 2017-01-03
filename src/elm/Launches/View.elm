module Launches.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Launches.Messages exposing (Msg(..))
import Launches.Models exposing (Launches, Launch, LaunchId)
import RemoteData exposing (..)
import Components.ViewHelpers as ViewHelpers
import Components.Copy exposing (copy)


itemView : Maybe Launch -> Html Msg
itemView launch =
    case launch of
        Nothing ->
            div [] [ text copy.launchInactive ]

        Just l ->
            div []
                [ h2 [] [ ViewHelpers.dateHeading l.isoStart ]
                , p [] [ text l.location.name ]
                , h1 [] [ text l.name ]
                , p [] [ text (toString launch) ]
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
            div [] [ text copy.loading ]

        Failure e ->
            div [] [ text copy.launchesError ]

        Success data ->
            itemView launch


listView : Launches -> List (Html Msg)
listView model =
    case model.data of
        NotAsked ->
            [ li [] []
            ]

        Loading ->
            [ li [] [ text copy.loading ]
            ]

        Failure e ->
            [ li [] [ text copy.launchesError ]
            ]

        Success data ->
            (List.map listItemView data)


view : Launches -> Maybe Launch -> Html Msg
view model launch =
    div [ class "mainContainer" ]
        [ aside [ class "aside" ]
            [ h3 [] [ text copy.launchesList ]
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
