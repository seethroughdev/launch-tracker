module Launches.Models exposing (..)


type alias Launch =
    { id : Int
    , name : String
    , date : String
    , status : Int
    }


initLaunch : Launch
initLaunch =
    { id = 0
    , name = ""
    , date = ""
    , status = 0
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
      }
    , { id = 879
      , name = "Falcon 9 Full Thrust | 10 x Iridium NEXT (1-10)"
      , date = "20170105T203600Z"
      , status = 2
      }
    ]
