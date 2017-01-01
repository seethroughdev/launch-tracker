module Models exposing (..)

import Launches.Models exposing (Launches, initLaunches)
import Routes


type alias Model =
    { route : Routes.Route
    , launches : Launches
    }


initialModel : Routes.Route -> Model
initialModel route =
    { route = route
    , launches = initLaunches
    }
