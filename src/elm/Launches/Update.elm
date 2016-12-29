module Launches.Update exposing (..)

import Launches.Models exposing (Launches)
import Launches.Messages exposing (Msg(..))


update : Msg -> Launches -> ( Launches, Cmd Msg )
update msg model =
    case msg of
        -- setCurrentLaunch
        Noop ->
            ( model, Cmd.none )
