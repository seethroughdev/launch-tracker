module Launches.Update exposing (..)

import Launches.Messages exposing (Msg(..))
import RemoteData exposing (..)
import Launches.Models exposing (..)


getCurrentLaunch : LaunchId -> WebData (List Launch) -> Maybe Launch
getCurrentLaunch launchId launches =
    case launches of
        NotAsked ->
            Nothing

        Loading ->
            Nothing

        Failure e ->
            Nothing

        Success data ->
            if launchId == 0 then
                List.head data
            else
                data
                    |> List.filter (\u -> u.id == launchId)
                    |> List.head


update : Msg -> Launches -> ( Launches, Cmd Msg )
update msg model =
    case msg of
        LaunchesResponse response ->
            let
                currentLaunch =
                    getCurrentLaunch 0 response
            in
                ( { model
                    | data = response
                    , currentLaunch = currentLaunch
                  }
                , Cmd.none
                )
