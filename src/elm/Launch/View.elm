module Launch.View exposing (..)

import Html exposing (..)
import Launch.Messages exposing (Msg(..))
import Launch.Models exposing (Launches)


view : Launches -> Html Msg
view launches =
    div []
        [ h3 [] [ text "Launches" ]
        ]
