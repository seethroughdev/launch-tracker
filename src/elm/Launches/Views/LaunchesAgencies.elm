module Launches.Views.LaunchesAgencies exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Launches.Models exposing (Launch, Agency)


-- import Launches.Messages exposing (Msg(..))

import Components.Buttons as Button exposing (Btn)


buttonGroup : Agency -> List (Btn msg)
buttonGroup a =
    [ Btn
        "Website"
        Button.Small
        Button.Tertiary
        Button.Noop
        Nothing
    , Btn
        "Wiki"
        Button.Small
        Button.Tertiary
        Button.Noop
        Nothing
    ]


renderAgency : Agency -> Html msg
renderAgency a =
    Debug.log (toString a)
        li
        []
        [ h5 [] [ text a.name ]
        , ul []
            (List.map Button.view (buttonGroup a))
        ]


view : Launch -> Html msg
view launch =
    let
        agencies =
            launch.location.pads
                |> List.map (\pad -> pad.agencies)
                |> List.concat
    in
        ul [ class "agenciesList" ]
            (List.map renderAgency agencies)
