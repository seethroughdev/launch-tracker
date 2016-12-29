module Launches.Update exposing (..)

import Launches.Models exposing (..)
import Launches.Messages exposing (Msg(..))


createLaunch : LaunchResponse -> Launch
createLaunch resp =
    let
        missions =
            List.head resp.missions

        -- @TODO - get missions in here
    in
        Launch
            resp.id
            resp.name
            resp.isoStart
            resp.status
            resp.location
            ""


getCurrentLaunch : LaunchId -> List Launch -> Maybe Launch
getCurrentLaunch launchId launches =
    launches
        |> List.filter (\u -> u.id == launchId)
        |> List.head


update : Msg -> Launches -> ( Launches, Cmd Msg )
update msg model =
    case msg of
        SetCurrentLaunch launchId ->
            let
                d =
                    getCurrentLaunch launchId model.data
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

                currentLaunch =
                    getCurrentLaunch 879 launches
            in
                ( { model
                    | data = launches
                    , currentLaunch = currentLaunch
                  }
                , Cmd.none
                )

        OnFetchAll (Err error) ->
            Debug.log (toString error)
                ( model, Cmd.none )
