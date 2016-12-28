module Launch.Update exposing (..)

import Launch.Models exposing (Launches)
import Launch.Messages exposing (Msg(..))


update : Msg -> Launches -> ( Launches, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )
