module Launches.Models exposing (..)

import RemoteData exposing (..)


type alias LocationId =
    Int


type alias LaunchId =
    Int


type alias Launches =
    { data : WebData (List Launch)
    , currentLaunch : Maybe Launch
    , launchQuery : String
    , menu : LaunchMenu
    }


initLaunches : Launches
initLaunches =
    Launches Loading Nothing "" Main


type LaunchMenu
    = Main
    | Agencies
    | Rocket
    | Location



-- RESPONSES


type alias Launch =
    { id : LaunchId
    , name : String
    , wsstamp : Float
    , westamp : Float
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
    , pads : List Pad
    }


type alias Agency =
    { id : Int
    , name : String
    , abbrev : String
    , countryCode :
        String
        -- , type : Int
    , infoURL : String
    , wikiURL : String
    }


type alias Pad =
    { id : Int
    , name : String
    , infoURL : String
    , wikiURL : String
    , agencies : List Agency
    }
