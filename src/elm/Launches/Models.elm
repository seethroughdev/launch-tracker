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
    Launches Loading Nothing "" MainMenu


type LaunchMenu
    = MainMenu
    | AgenciesMenu
    | RocketMenu
    | LocationMenu



-- RESPONSES


type alias Launch =
    { id : LaunchId
    , name : String
    , wsstamp : Float
    , westamp : Float
    , isoStart : String
    , status : Int
    , location : Location
    , missions : List Mission
    , vidURLs : List String
    , rocket : Rocket
    }


type alias Mission =
    { description : String
    }


type alias Location =
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


type alias Rocket =
    { id : Int
    , name : String
    , configuration : String
    , familyname : String
    , agencies : List Agency
    , wikiURL : String
    , infoURL : String
    , imageSizes : List Int
    , imageURL : String
    }
