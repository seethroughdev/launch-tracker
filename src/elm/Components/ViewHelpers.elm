module Components.ViewHelpers exposing (..)

import Date.Extra as Date
import Html exposing (..)


renderLaunchDate : String -> Html msg
renderLaunchDate d =
    case Date.fromIsoString d of
        Nothing ->
            text "No date"

        Just dateString ->
            let
                formattedDate =
                    dateString
                        |> Date.toFormattedString "EEEE, MMMM d, y 'at' h:mm a"
            in
                text formattedDate
