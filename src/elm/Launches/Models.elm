module Launches.Models exposing (..)

import RemoteData exposing (..)


type alias LocationId =
    Int


type alias LaunchId =
    Int


initLocation : Location
initLocation =
    { id = 0
    , name = ""
    , countryCode = ""
    }


type alias Launches =
    { data : WebData (List Launch)
    , currentLaunch : Maybe Launch
    , launchQuery : String
    }


initLaunches : Launches
initLaunches =
    Launches NotAsked Nothing ""



-- RESPONSES


type alias Launch =
    { id : LaunchId
    , name : String
    , isoStart : String
    , status : Int
    , location : Location
    , missions : List Mission
    }


type alias Mission =
    { description : String
    }


type alias Location =
    { id : Int
    , name : String
    , countryCode : String
    }
