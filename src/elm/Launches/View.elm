module Launches.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Launches.Messages exposing (Msg(..))
import Launches.Models exposing (Launches, Launch, LaunchId)
import RemoteData exposing (..)


-- import Date exposing (Month(..))

import Date.Extra as Date


renderLaunchDate : String -> Html Msg
renderLaunchDate d =
    case Date.fromIsoString d of
        Nothing ->
            text "No date"

        Just dateString ->
            let
                formattedDate =
                    dateString
                        |> Date.toFormattedString "EEEE, MMMM d, y 'at' h:mm a"
            in
                text formattedDate


listLaunch : Launch -> Html Msg
listLaunch launch =
    li []
        [ h4 [] [ text launch.name ]
        , p [] [ text launch.location.name ]
        , p [] [ renderLaunchDate launch.isoStart ]
        ]


renderListLaunch : WebData (List Launch) -> Html Msg
renderListLaunch data =
    case data of
        NotAsked ->
            li [] []

        Loading ->
            li [] [ text "Loading" ]

        Failure e ->
            li [] [ text (toString e) ]

        Success data ->
            ul []
                (List.map listLaunch data)


listView : Launches -> Html Msg
listView launches =
    aside [ class "aside" ]
        [ h3 [] [ text "Upcoming Launches" ]
        , renderListLaunch launches.data
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
            renderLaunch value

        Nothing ->
            div []
                [ h4 [] [ text "Launch" ]
                , text "Loading Launch"
                ]


view : Launches -> Maybe LaunchId -> Html Msg
view model launchId =
    div [ class "mainContainer" ]
        [ listView model
        , main_ [ class "main" ]
            [ launchView model
            ]
        ]
