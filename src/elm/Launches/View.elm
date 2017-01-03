module Launches.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Launches.Messages exposing (Msg(..))
import Launches.Models exposing (Launches, Launch, LaunchId)
import RemoteData exposing (..)
import Components.Copy exposing (copy)
import Components.LaunchesList as LaunchesList
import Components.LaunchesItem as LaunchesItem


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
            LaunchesItem.view launch


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
            (List.map LaunchesList.view data)


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
