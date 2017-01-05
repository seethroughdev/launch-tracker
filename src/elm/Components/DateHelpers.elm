module Components.DateHelpers exposing (..)

import Date exposing (fromTime, Date)
import Date.Extra as Date exposing (..)
import Time exposing (Time)


stringFromTime : String -> Float -> String
stringFromTime template time =
    toFormattedString template (Date.fromTime time)


stringFromDate : String -> String -> String
stringFromDate template date =
    case fromIsoString date of
        Nothing ->
            "No date"

        Just d ->
            toFormattedString template d


dateHeading : String -> String
dateHeading d =
    stringFromDate "MMM d" d


launchDate : String -> String
launchDate d =
    stringFromDate "EEEE, MMMM d, y 'at' h:mm a" d


launchWindow : Float -> Float -> String
launchWindow start end =
    let
        startTime =
            stringFromTime "h:mm a" (start * 1000)

        endTime =
            stringFromTime "h:mm a" (end * 1000)
    in
        startTime ++ " - " ++ endTime


launchTime : String -> String
launchTime date =
    stringFromDate "h:mm a" date
