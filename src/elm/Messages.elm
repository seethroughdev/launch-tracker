module Messages exposing (..)

import Navigation exposing (Location)
import Launches.Messages


type Msg
    = LaunchesMsg Launches.Messages.Msg
    | OnLocationChange Location
