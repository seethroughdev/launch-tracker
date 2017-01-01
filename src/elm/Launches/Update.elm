module Launches.Update exposing (..)

import Launches.Messages exposing (Msg(..))
import RemoteData exposing (..)
import Launches.Models exposing (..)
import Navigation
import List.Extra as List
import Routes exposing (Route(..), locationToString)


getOffsetId : Int -> LaunchId -> WebData (List Launch) -> Maybe LaunchId
getOffsetId offset id launches =
    case launches of
        NotAsked ->
            Nothing

        Loading ->
            Nothing

        Failure e ->
            Nothing

        Success data ->
            let
                newIndex =
                    List.findIndex (\l -> l.id == id) data

                len =
                    List.length data

                headItem =
                    List.head data
            in
                case newIndex of
                    Nothing ->
                        Nothing

                    Just i ->
                        let
                            d =
                                List.getAt (i + offset) data
                        in
                            case d of
                                Nothing ->
                                    case headItem of
                                        Nothing ->
                                            Nothing

                                        Just item ->
                                            Just item.id

                                Just item ->
                                    Just item.id


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
                  }
                , Cmd.none
                )

        ShowLaunches ->
            ( model, Navigation.newUrl (locationToString LaunchesRoute) )

        ShowLaunch id ->
            ( model, Navigation.newUrl (locationToString (LaunchRoute id)) )

        ShowNextLaunch id ->
            let
                nextId =
                    getOffsetId 1 id model.data
            in
                case nextId of
                    Nothing ->
                        ( model, Cmd.none )

                    Just val ->
                        ( model, Navigation.newUrl (locationToString (LaunchRoute val)) )

        ShowPrevLaunch id ->
            let
                nextId =
                    getOffsetId -1 id model.data
            in
                case nextId of
                    Nothing ->
                        ( model, Cmd.none )

                    Just val ->
                        ( model, Navigation.newUrl (locationToString (LaunchRoute val)) )
