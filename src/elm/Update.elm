module Update exposing (..)

import Navigation
import Routes exposing (parseLocation, locationToString)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Launches.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        LaunchesMsg subMsg ->
            let
                ( m, cmd ) =
                    Launches.Update.update subMsg model.launches
            in
                ( { model | launches = m }, Cmd.none )

        GoTo route ->
            Debug.log (locationToString route)
                ( model, Navigation.newUrl (locationToString route) )
