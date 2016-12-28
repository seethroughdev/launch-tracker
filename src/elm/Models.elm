module Models exposing (..)

import Launches.Models exposing (..)
import Routes


type alias Model =
    { route : Routes.Route
    , launches : Launches
    }


initialModel : Routes.Route -> Model
initialModel route =
    { route = route
    , launches = tempLaunches
    }
