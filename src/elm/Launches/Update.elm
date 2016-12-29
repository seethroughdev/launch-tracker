module Launches.Update exposing (..)

import Launches.Models exposing (..)
import Launches.Messages exposing (Msg(..))


createLaunch : LaunchResponse -> Launch
createLaunch resp =
    let
        missions =
            List.head resp.missions
    in
        Launch
            resp.id
            resp.name
            resp.isoStart
            resp.status
            resp.location
            ""


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

        OnFetchAll (Ok resp) ->
            let
                launches =
                    List.map createLaunch resp
            in
                ( { model | data = launches }, Cmd.none )

        OnFetchAll (Err error) ->
            Debug.log (toString error)
                ( model, Cmd.none )
