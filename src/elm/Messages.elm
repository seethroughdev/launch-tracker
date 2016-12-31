module Messages exposing (..)

import Navigation exposing (Location)
import Launches.Messages
import Routes exposing (Route)


type Msg
    = OnLocationChange Location
    | LaunchesMsg Launches.Messages.Msg
    | GoTo Route
