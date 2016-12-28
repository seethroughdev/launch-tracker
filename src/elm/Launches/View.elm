module Launches.View exposing (..)

import Html exposing (..)
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
    div []
        [ h3 [] [ text "Upcoming Launches" ]
        , ul []
            (List.map listLaunch launches)
        ]


launchView : Maybe Launch -> Html Msg
launchView launch =
    div []
        [ h4 [] [ text "Launcheroni" ]
        , text (toString launch)
        ]


view : Launches -> Maybe Launch -> Html Msg
view launches launch =
    main_ []
        [ listView launches
        , launchView launch
        ]
