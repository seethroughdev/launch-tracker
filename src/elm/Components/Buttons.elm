module Components.Buttons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, style, href, disabled)
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
    , disabled : Bool
    , href : Maybe String
    , cb : Maybe msg
    }


getBtnSize : BtnSize -> List ( String, String )
getBtnSize size =
    case size of
        Small ->
            [ ( "fontSize", "0.75rem" )
            , ( "lineHeight", "1.5" )
            , ( "padding", "5px 10px" )
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

        Tertiary ->
            [ ( "borderColor", "#73FF4E" )
            , ( "color", "#73FF4E" )
            ]

        _ ->
            [ ( "", "" ) ]


buttonStyle : Btn msg -> List (List ( String, String ))
buttonStyle btn =
    [ getBtnSize btn.size
    , getBtnIntent btn.intent
    ]


disabledClass : Bool -> String
disabledClass val =
    if val then
        " disabled"
    else
        ""


renderEmptySpan : Btn msg -> Html msg
renderEmptySpan btn =
    span
        [ class "button disabled"
        , style <| List.concat (buttonStyle btn)
        ]
        [ text btn.text ]


viewHref : Btn msg -> Html msg
viewHref btn =
    case btn.href of
        Nothing ->
            renderEmptySpan btn

        Just str ->
            if str == "" then
                renderEmptySpan btn
            else
                a
                    [ class ("button" ++ disabledClass btn.disabled)
                    , href str
                    , style <| List.concat (buttonStyle btn)
                    ]
                    [ text btn.text ]


view : Btn msg -> Html msg
view btn =
    case btn.cb of
        Nothing ->
            renderEmptySpan btn

        Just cb ->
            button
                [ class ("button" ++ disabledClass btn.disabled)
                , disabled btn.disabled
                , onClick cb
                , style <| List.concat (buttonStyle btn)
                ]
                [ text btn.text ]
