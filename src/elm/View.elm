module View exposing (..)

import Routes exposing (Route(..))
import Html exposing (..)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Launches.Models exposing (LaunchId)
import Launches.View
import Launches.Update exposing (getCurrentLaunch)


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        LaunchesRoute ->
            renderLaunchesPage model 0

        LaunchRoute id ->
            renderLaunchesPage model id

        NotFoundRoute ->
            notFoundView


renderLaunchesPage : Model -> LaunchId -> Html Msg
renderLaunchesPage model launchId =
    let
        currentLaunch =
            getCurrentLaunch launchId model.launches.data
    in
        case currentLaunch of
            Just launch ->
                Html.map LaunchesMsg (Launches.View.view model.launches currentLaunch)

            Nothing ->
                notFoundView


notFoundView : Html Msg
notFoundView =
    div []
        [ h3 [] [ text "Hello world" ]
        ]
