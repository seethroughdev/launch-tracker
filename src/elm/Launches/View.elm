module Launches.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Launches.Messages exposing (Msg(..))
import Launches.Models exposing (Launches, Launch)


listLaunch : Launch -> Html Msg
listLaunch launch =
    li []
        [ h4 [] [ text launch.name ]
        , p [] [ text launch.location.name ]
        , p [] [ text launch.date ]
        ]


listView : Launches -> Html Msg
listView launches =
    aside [ class "aside" ]
        [ h3 [] [ text "Upcoming Launches" ]
        , ul []
            (List.map listLaunch launches)
        ]


launchView : Maybe Launch -> Html Msg
launchView launch =
    main_ [ class "main" ]
        [ div []
            [ h4 [] [ text "Launcheroni" ]
            , text (toString launch)
            ]
        ]


view : Launches -> Maybe Launch -> Html Msg
view launches launch =
    div [ class "mainContainer" ]
        [ listView launches
        , launchView launch
        ]
