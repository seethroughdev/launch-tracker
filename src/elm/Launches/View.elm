module Launches.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Launches.Messages exposing (Msg(..))
import Launches.Models exposing (Launches, Launch, LaunchId)
import RemoteData exposing (..)
import Components.Copy exposing (copy)
import Launches.Views.LaunchesList as LaunchesList
import Launches.Views.LaunchesItem as LaunchesItem


launchView : Launches -> Maybe Launch -> Html Msg
launchView model launch =
    case model.data of
        NotAsked ->
            div [] []

        Loading ->
            div [] [ text copy.loading ]

        Failure e ->
            Debug.log (toString e)
                div
                []
                [ text copy.launchesError ]

        Success data ->
            LaunchesItem.view model.menu launch


listView : Launches -> Maybe Launch -> List (Html Msg)
listView model currentLaunch =
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
            let
                launchView launch =
                    LaunchesList.view launch currentLaunch
            in
                (List.map launchView data)


view : Launches -> Maybe Launch -> Html Msg
view model launch =
    div [ class "body" ]
        [ div [ class "mainContainer" ]
            [ aside [ class "aside" ]
                [ div [ class "content" ]
                    [ h3 [] [ text copy.launchesList ]
                    , ul [ class "launchesList" ]
                        (listView model launch)
                    ]
                ]
            , main_ [ class "main" ]
                [ div [ class "content" ]
                    [ h4 [] [ text "Launch" ]
                    , (launchView model launch)
                    ]
                , footer [ class "footer" ]
                    [ text "This is the footer"
                    ]
                ]
            ]
        ]
