module Launches.Models exposing (..)

import RemoteData exposing (..)


type alias LocationId =
    Int


type alias LaunchId =
    Int


initLocation : LocationType
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
    Launches Loading Nothing ""



-- RESPONSES


type alias Launch =
    { id : LaunchId
    , name : String
    , isoStart : String
    , status : Int
    , location : LocationType
    , missions : List Mission
    }


type alias Mission =
    { description : String
    }


type alias LocationType =
    { id : Int
    , name : String
    , countryCode : String
    }
