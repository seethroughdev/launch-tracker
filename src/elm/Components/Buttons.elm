module Components.Buttons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style)


type BtnSize
    = Small
    | Medium
    | Large


type BtnIntent
    = Primary
    | Secondary
    | Tertiary
    | Success
    | Warning
    | Error


type BtnIcon
    = Watch
    | Alarm
    | Noop


type alias Btn =
    { text : String
    , size : BtnSize
    , intent : BtnIntent
    , icon : BtnIcon
    }


getBtnSize : BtnSize -> List ( String, String )
getBtnSize size =
    case size of
        Small ->
            [ ( "fontSize", "0.8rem" )
            , ( "lineHeight", "1.5" )
            ]

        Large ->
            [ ( "fontSize", "1.33rem" )
            , ( "lineHeight", "1.5" )
            ]

        _ ->
            [ ( "", "" ) ]


getBtnIntent : BtnIntent -> List ( String, String )
getBtnIntent intent =
    case intent of
        Secondary ->
            [ ( "borderColor", "#38C0FF" )
            , ( "color", "#38C0FF" )
            ]

        _ ->
            [ ( "", "" ) ]


buttonStyle : Btn -> List (List ( String, String ))
buttonStyle btn =
    [ getBtnSize btn.size
    , getBtnIntent btn.intent
    ]


view : Btn -> Html msg
view btn =
    button
        [ class "button"
        , style <| List.concat (buttonStyle btn)
        ]
        [ text btn.text ]
