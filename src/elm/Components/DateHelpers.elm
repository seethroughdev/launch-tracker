module Components.DateHelpers exposing (..)

import Date exposing (fromTime)
import Date.Extra as Date exposing (..)
import Components.Copy exposing (copy)
import Html exposing (..)


getDateString : String -> String -> Html msg
getDateString template d =
    case fromIsoString d of
        Nothing ->
            text "No date"

        Just dateString ->
            let
                formattedDate =
                    dateString
                        |> toFormattedString template
            in
                text formattedDate


dateHeading : String -> Html msg
dateHeading d =
    getDateString "MMM d" d


launchDate : String -> Html msg
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
