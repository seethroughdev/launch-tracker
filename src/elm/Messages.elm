module Messages exposing (..)

import Navigation exposing (Location)
import Launches.Messages


type Msg
    = OnLocationChange Location
    | LaunchesMsg Launches.Messages.Msg
