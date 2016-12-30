module Launches.Update exposing (..)

import Launches.Messages exposing (Msg(..))
import RemoteData exposing (..)
import Launches.Models exposing (..)


--
-- getCurrentLaunch : LaunchId -> WebData (List LaunchReponse) -> Maybe LaunchReponse
-- getCurrentLaunch launchId launches =
--     launches
--         |> List.filter (\u -> u.id == launchId)
--         |> List.head


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



-- case msg of
-- SetCurrentLaunch launchId ->
--     let
--         d =
--             getCurrentLaunch launchId model.data
--     in
--         case d of
--             Just value ->
--                 ( { model | currentLaunch = d }, Cmd.none )
--
--             Nothing ->
--                 ( model, Cmd.none )
-- OnFetchAll (Ok resp) ->
--     let
--         launches =
--             List.map createLaunch resp
--
--         currentLaunch =
--             getCurrentLaunch 879 launches
--     in
--         ( { model
--             | data = launches
--             , currentLaunch = currentLaunch
--           }
--         , Cmd.none
--         )
--
-- OnFetchAll (Err error) ->
--     Debug.log (toString error)
--         ( model, Cmd.none )
