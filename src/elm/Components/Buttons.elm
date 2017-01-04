module Components.Buttons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)


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


type alias Btn msg =
    { text : String
    , size : BtnSize
    , intent : BtnIntent
    , icon : BtnIcon
    , cb : Maybe msg
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


buttonStyle : Btn msg -> List (List ( String, String ))
buttonStyle btn =
    [ getBtnSize btn.size
    , getBtnIntent btn.intent
    ]


view : Btn msg -> Html msg
view btn =
    case btn.cb of
        Nothing ->
            button
                [ class "button"
                , style <| List.concat (buttonStyle btn)
                ]
                [ text btn.text ]

        Just cb ->
            button
                [ class "button"
                , onClick cb
                , style <| List.concat (buttonStyle btn)
                ]
                [ text btn.text ]
