module Components.DateHelpers exposing (..)

import Date.Extra as Date
import Html exposing (..)


getDateString : String -> String -> Html msg
getDateString template d =
    case Date.fromIsoString d of
        Nothing ->
            text "No date"

        Just dateString ->
            let
                formattedDate =
                    dateString
                        |> Date.toFormattedString template
            in
                text formattedDate


dateHeading : String -> Html msg
dateHeading d =
    getDateString "MMM d" d


renderLaunchDate : String -> Html msg
renderLaunchDate d =
    getDateString "EEEE, MMMM d, y 'at' h:mm a" d
