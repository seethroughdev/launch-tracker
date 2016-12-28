module Routes exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        []


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
