module Launches.Messages exposing (..)

import Launches.Models exposing (Launch)
import RemoteData


type Msg
    = LaunchesResponse (RemoteData.WebData (List Launch))
