module Launches.Messages exposing (..)

import Launches.Models exposing (Launch, LaunchId, LaunchMenu)
import RemoteData


type Msg
    = LaunchesResponse (RemoteData.WebData (List Launch))
    | ShowLaunches
    | ShowLaunch LaunchId
    | ShowNextLaunch LaunchId
    | ShowPrevLaunch LaunchId
    | ChangeMenu LaunchMenu
