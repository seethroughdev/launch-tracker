module Launches.Views.LaunchesItem exposing (view)

import Html exposing (..)
import Components.DateHelpers as DateHelpers
import Launches.Models exposing (Launches, Launch, LaunchId, Mission, LaunchMenu)
import Launches.Messages exposing (Msg(..))
import Components.Copy exposing (copy)
import Launches.Views.LaunchesMenu as LaunchesMenu
import Components.Buttons as Button exposing (Btn)


prevButton : Launch -> Btn Msg
prevButton launch =
    Btn
        "Previous"
        Button.Small
        Button.Secondary
        Button.Noop
        Nothing
        (Just (ShowPrevLaunch launch.id))


nextButton : Launch -> Btn Msg
nextButton launch =
    Btn
        "Next"
        Button.Small
        Button.Secondary
        Button.Noop
        Nothing
        (Just (ShowNextLaunch launch.id))


renderButtonNav : Launch -> Html Msg
renderButtonNav launch =
    div []
        [ Button.view (prevButton launch)
        , Button.view (nextButton launch)
        ]


watchButton : Btn msg
watchButton =
    Btn
        copy.watchLaunch
        Button.Large
        Button.Primary
        Button.Watch
        Nothing
        Nothing


getAlarmText : Launch -> String
getAlarmText l =
    if l.wsstamp == l.westamp then
        DateHelpers.launchTime l.isoStart
    else
        DateHelpers.launchWindow l.wsstamp l.westamp


alarmButton : Launch -> Btn msg
alarmButton l =
    Btn
        (getAlarmText l)
        Button.Small
        Button.Secondary
        Button.Alarm
        Nothing
        Nothing


renderMissionDescriptions : Mission -> Html Msg
renderMissionDescriptions mission =
    li [] [ text mission.description ]


view : LaunchMenu -> Maybe Launch -> Html Msg
view menu launch =
    case launch of
        Nothing ->
            div [] [ text copy.launchInactive ]

        Just l ->
            div []
                [ renderButtonNav l
                , h2 [] [ text (DateHelpers.dateHeading l.isoStart) ]
                , p [] [ text l.location.name ]
                , h1 [] [ text l.name ]
                , p [] [ Button.view (alarmButton l) ]
                , LaunchesMenu.view menu l
                , ul []
                    (List.map renderMissionDescriptions l.missions)
                , Button.view watchButton
                , hr [] []
                , p [] [ text (toString launch) ]
                ]
