module Launches.Views.LaunchesList exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Components.DateHelpers as DateHelpers
import Launches.Models exposing (Launches, Launch, LaunchId)
import Launches.Messages exposing (Msg(..))


isActive : LaunchId -> Maybe Launch -> String
isActive id currentLaunch =
    case currentLaunch of
        Nothing ->
            ""

        Just current ->
            if (id == current.id) then
                "isActive"
            else
                ""


view : Launch -> Maybe Launch -> Html Msg
view launch currentLaunch =
    li
        [ class (isActive launch.id currentLaunch)
        , onClick (ShowLaunch launch.id)
        ]
        [ h4 [] [ text (launch.name ++ " - " ++ (toString launch.id)) ]
        , p [] [ text launch.location.name ]
        , p [] [ text (DateHelpers.launchDate launch.isoStart) ]
        ]
