module View exposing (..)

import Routes exposing (Route(..))
import Html exposing (..)
import Messages exposing (Msg(..))
import Models exposing (Model)


view : Model -> Html Msg
view model =
    div []
        [ page model
        ]


page : Model -> Html Msg
page model =
    case model.route of
        NotFoundRoute ->
            notFoundView


notFoundView : Html Msg
notFoundView =
    div []
        [ h3 [] [ text "Hello world" ]
        ]
