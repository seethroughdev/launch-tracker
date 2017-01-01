module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Launches.Update
import Routes exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LaunchesMsg subMsg ->
            let
                ( updatedLaunches, cmd ) =
                    Launches.Update.update subMsg model.launches
            in
                ( { model | launches = updatedLaunches }, Cmd.map LaunchesMsg cmd )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )
