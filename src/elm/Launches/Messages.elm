module Launches.Messages exposing (..)

import Http
import Launches.Models exposing (LaunchId, LaunchResponse)


type Msg
    = SetCurrentLaunch LaunchId
    | OnFetchAll (Result Http.Error (List LaunchResponse))
