module Launches.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
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
    li [ onClick (ShowLaunch launch.id) ]
        [ h4 [] [ text launch.name ]
        , p [] [ text launch.location.name ]
        , p [] [ renderLaunchDate launch.isoStart ]
        , p [] [ text (toString launch.id) ]
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
    div [ onClick (ShowLaunch 42) ]
        [ h4 [] [ text "Launch" ]
        , h1 [] [ text launch.name ]
        , text (toString launch)
        ]


renderNoLaunch : Html Msg
renderNoLaunch =
    div []
        [ text "That launch no longer exists, try another"
        ]


launchView : Maybe Launch -> Html Msg
launchView launch =
    case launch of
        Just value ->
            renderLaunch value

        Nothing ->
            div []
                [ h4 [] [ text "Launch" ]
                , text "Loading Launch"
                ]


view : Launches -> Maybe Launch -> Html Msg
view model launch =
    div [ class "mainContainer" ]
        [ listView model
        , main_ [ class "main" ]
            [ launchView launch
            , button [ onClick ShowLaunches ] [ text "Show em!" ]
            ]
        ]
