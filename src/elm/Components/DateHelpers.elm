module Components.DateHelpers exposing (..)

import Date exposing (fromTime)
import Date.Extra as Date exposing (..)
import Components.Copy exposing (copy)
import Html exposing (..)


getDateString : String -> String -> String
getDateString template d =
    case fromIsoString d of
        Nothing ->
            "No date"

        Just dateString ->
            let
                formattedDate =
                    dateString
                        |> toFormattedString template
            in
                formattedDate


dateHeading : String -> String
dateHeading d =
    getDateString "MMM d" d


launchDate : String -> String
launchDate d =
    getDateString "EEEE, MMMM d, y 'at' h:mm a" d


launchWindow : Float -> Float -> Html msg
launchWindow start end =
    if start == end then
        span [] [ text copy.noLaunchWindow ]
    else
        let
            startTime =
                Date.fromTime (start * 1000)

            endTime =
                Date.fromTime (end * 1000)

            w =
                Date.diff Minute startTime endTime
        in
            span [] [ text ("Window ~" ++ (toString w) ++ " min") ]


launchTime : String -> String
launchTime d =
    getDateString "h:mm a" d
