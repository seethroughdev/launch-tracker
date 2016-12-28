module Launches.Models exposing (..)


type alias Location =
    { id : Int
    , name : String
    , countryCode : String
    }


initLocation =
    { id = 0
    , name = ""
    , countryCode = ""
    }


type alias Launch =
    { id : Int
    , name : String
    , date : String
    , status : Int
    , location : Location
    , description : String
    }


initLaunch : Launch
initLaunch =
    { id = 0
    , name = ""
    , date = ""
    , status = 0
    , location = initLocation
    , description = ""
    }


type alias Launches =
    List Launch


initLaunches : Launches
initLaunches =
    []


tempLaunches : List Launch
tempLaunches =
    [ { id = 767
      , name = "Atlas V 401 | NROL-79"
      , date = "20170120T000000Z"
      , status = 2
      , location = tempLocation1
      , description = "Iridium NEXT is a second-generation worldwide network of telecommunications satellites to eventually replace the old Iridium constellation. These satellites will incorporate features such as data transmission which were not emphasized in the original design."
      }
    , { id = 879
      , name = "Falcon 9 Full Thrust | 10 x Iridium NEXT (1-10)"
      , date = "20170105T203600Z"
      , status = 2
      , location = tempLocation2
      , description = "his is the first test flight of the Electron rocket. Built and operated by Rocket Lab, Electron is meant to offer low-price launches for the small-sat market."
      }
    ]


tempLocation1 =
    { id = 124
    , name = "Onenui Station, Mahia Peninsula, New Zealand"
    , countryCode = "NZL"
    }


tempLocation2 =
    { id = 40
    , name = "Vandenberg AFB, CA, USA"
    , countryCode = "USA"
    }
