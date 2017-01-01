module Routes exposing (..)

import Navigation exposing (Location)
import Launches.Models exposing (LaunchId)
import UrlParser exposing (..)


type Route
    = LaunchesRoute
    | LaunchRoute LaunchId
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map LaunchesRoute top
        , map LaunchRoute (s "launches" </> int)
        , map LaunchesRoute (s "launches")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
