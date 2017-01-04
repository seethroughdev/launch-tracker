module Launches.Views.LaunchesList exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Components.DateHelpers as DateHelpers
import Launches.Models exposing (Launches, Launch, LaunchId)
import Launches.Messages exposing (Msg(..))


isActive : LaunchId -> Maybe LaunchId -> String
isActive id currentId =
    case currentId of
        Nothing ->
            ""

        Just current ->
            if (id == current) then
                "isActive"
            else
                ""


view : Launch -> Maybe LaunchId -> Html Msg
view launch id =
    li
        [ class (isActive launch.id id)
        , onClick (ShowLaunch launch.id)
        ]
        [ h4 [] [ text launch.name ]
        , p [] [ text launch.location.name ]
        , p [] [ text (DateHelpers.launchDate launch.isoStart) ]
        , p [] [ text (toString launch.id) ]
        ]
