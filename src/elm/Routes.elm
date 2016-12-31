module Routes exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)
import Launches.Models exposing (LaunchId)


type Route
    = NotFoundRoute
    | LaunchRoute LaunchId
    | LaunchesRoute


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


locationToString : Route -> String
locationToString location =
    case location of
        LaunchesRoute ->
            "/#launches"

        LaunchRoute launchId ->
            "/#launches/" ++ (toString launchId)

        NotFoundRoute ->
            "404.html"
