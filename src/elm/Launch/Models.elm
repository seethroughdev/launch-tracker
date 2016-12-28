module Launch.Models exposing (..)


type alias Launch =
    { id : Int
    , name : String
    , date : String
    , status : Int
    }


initLaunch : Launch
initLaunch =
    { id = 767
    , name = "Atlas V 401 | NROL-79"
    , date = "20170120T000000Z"
    , status = 2
    }


type alias Launches =
    List Launch


initLaunches : Launches
initLaunches =
    [ initLaunch ]
