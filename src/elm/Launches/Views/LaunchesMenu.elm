module Launches.Views.LaunchesMenu exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Launches.Models exposing (..)
import Launches.Messages exposing (Msg(..))
import Launches.Views.LaunchesAgencies as LaunchesAgencies exposing (view)


renderMissionDescriptions : Mission -> Html Msg
renderMissionDescriptions mission =
    li [] [ text mission.description ]


renderMain : Launch -> Html Msg
renderMain launch =
    div []
        [ h4 [] [ text "Main" ]
        , ul []
            (List.map renderMissionDescriptions launch.missions)
        ]


renderAgencies : Launch -> Html Msg
renderAgencies launch =
    div []
        [ h4 [] [ text "Agencies" ]
        , LaunchesAgencies.view launch
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


renderContainer : LaunchMenu -> Launch -> Html Msg
renderContainer launchMenu launch =
    case launchMenu of
        Main ->
            renderMain launch

        Agencies ->
            renderAgencies launch

        Rocket ->
            renderRocket launch

        Location ->
            renderLocation launch


isActiveClass : LaunchMenu -> LaunchMenu -> String
isActiveClass current el =
    if (current == el) then
        "isActive"
    else
        ""


getNavItem : LaunchMenu -> LaunchMenu -> Html Msg
getNavItem currentMenu menu =
    li
        [ class (isActiveClass currentMenu menu)
        , onClick (ChangeMenu menu)
        ]
        [ text (toString menu) ]


renderNav : LaunchMenu -> Html Msg
renderNav currentMenu =
    let
        renderNavItem menu =
            getNavItem currentMenu menu
    in
        ul [ class "launchMenu horizontalMenu" ]
            [ renderNavItem Main
            , renderNavItem Agencies
            , renderNavItem Rocket
            , renderNavItem Location
            ]


view : LaunchMenu -> Launch -> Html Msg
view currentMenu launch =
    div []
        [ renderNav currentMenu
        , renderContainer currentMenu launch
        ]
