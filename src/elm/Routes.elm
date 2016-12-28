module Routes exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = NotFoundRoute
    | LaunchesRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map LaunchesRoute top
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
