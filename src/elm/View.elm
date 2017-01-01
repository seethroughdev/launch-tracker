module View exposing (..)

import Routes exposing (Route(..))
import Html exposing (..)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Launches.Models exposing (LaunchId)
import Launches.List
import Launches.Edit
import Launches.Update exposing (getCurrentLaunch)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        LaunchesRoute ->
            Html.map LaunchesMsg (Launches.List.view model.launches)

        LaunchRoute id ->
            launchEditPage model id

        NotFoundRoute ->
            notFoundView


launchEditPage : Model -> LaunchId -> Html Msg
launchEditPage model launchId =
    let
        currentLaunch =
            getCurrentLaunch launchId model.launches.data
    in
        case currentLaunch of
            Just launch ->
                Html.map LaunchesMsg (Launches.Edit.view launch)

            Nothing ->
                notFoundView


notFoundView : Html Msg
notFoundView =
    div []
        [ h3 [] [ text "Hello world" ]
        ]
