module Launches.Update exposing (..)

import Launches.Models exposing (Launches)
import Launches.Messages exposing (Msg(..))


update : Msg -> Launches -> ( Launches, Cmd Msg )
update msg model =
    case msg of
        SetCurrentLaunch launchId ->
            let
                d =
                    model.data
                        |> List.filter (\u -> u.id == launchId)
                        |> List.head
            in
                case d of
                    Just value ->
                        ( { model | currentLaunch = d }, Cmd.none )

                    Nothing ->
                        ( model, Cmd.none )
