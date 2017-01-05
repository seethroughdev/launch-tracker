module Launches.Commands exposing (..)

import Http
import Json.Decode as Json exposing (..)
import Json.Decode.Pipeline exposing (decode, required, optional, requiredAt)
import Launches.Models exposing (Mission, Launch, LocationType, Agency)
import RemoteData


-- import Launches.Models exposing (..)

import Launches.Messages exposing (Msg(..))


fetchAll : Cmd Msg
fetchAll =
    Http.get fetchAllUrl collectionDecoder
        |> RemoteData.sendRequest
        |> Cmd.map LaunchesResponse


fetchAllUrl : String
fetchAllUrl =
    "https://launchlibrary.net/1.2/launch/next/25"


collectionDecoder : Json.Decoder (List Launch)
collectionDecoder =
    at [ "launches" ] launchesDecoder


launchesDecoder : Decoder (List Launch)
launchesDecoder =
    Json.list launchDecoder


launchDecoder : Json.Decoder Launch
launchDecoder =
    decode Launch
        |> required "id" int
        |> required "name" string
        |> required "wsstamp" float
        |> required "westamp" float
        |> required "isostart" string
        |> required "status" int
        |> required "location" locationDecoder
        |> required "missions" (list missionDecoder)
        |> required "agencies" (list agencyDecoder)


missionDecoder : Json.Decoder Mission
missionDecoder =
    decode Mission
        |> required "description" string


agencyDecoder : Json.Decoder Agency
agencyDecoder =
    decode Agency
        |> required "id" int
        |> required "name" string
        |> required "abbrev" string
        |> required "countryCode" string
        |> required "infoURL" string
        |> required "wikiURL" string


locationDecoder : Json.Decoder LocationType
locationDecoder =
    decode LocationType
        |> required "id" int
        |> required "name" string
        |> required "countryCode" string



--
--
-- import Json.Encode
-- import Json.Decode
-- -- elm-package install -- yes noredink/elm-decode-pipeline
-- import Json.Decode.Pipeline
--
-- type alias Something =
--     { 0 : Something0
--     }
--
-- type alias Something0Location =
--     { pads : List ComplexType
--     , id : Int
--     , name : String
--     , infoURL : String
--     , wikiURL : String
--     , countryCode : String
--     }
--
-- type alias Something0Rocket =
--     { id : Int
--     , name : String
--     , configuration : String
--     , familyname : String
--     , agencies : List ComplexType
--     , wikiURL : String
--     , infoURLs : List String
--     , infoURL : String
--     , imageSizes : List Int
--     , imageURL : String
--     }
--
-- type alias Something0 =
--     { id : Int
--     , name : String
--     , windowstart : String
--     , windowend : String
--     , net : String
--     , wsstamp : Int
--     , westamp : Int
--     , netstamp : Int
--     , isostart : String
--     , isoend : String
--     , isonet : String
--     , status : Int
--     , inhold : Int
--     , tbdtime : Int
--     , vidURLs : List String
--     , vidURL : Maybe ComplexType
--     , infoURLs : List ComplexType
--     , infoURL : Maybe ComplexType
--     , holdreason : Maybe ComplexType
--     , failreason : Maybe ComplexType
--     , tbddate : Int
--     , probability : Int
--     , hashtag : Maybe ComplexType
--     , location : Something0Location
--     , rocket : Something0Rocket
--     , missions : List ComplexType
--     }
--
-- decodeSomething : Json.Decode.Decoder Something
-- decodeSomething =
--     decode Something
--         |> required "0" (decodeSomething0)
--
-- decodeSomething0Location : Json.Decode.Decoder Something0Location
-- decodeSomething0Location =
--     decode Something0Location
--         |> required "pads" (Json.Decode.list decodeComplexType)
--         |> required "id" int
--         |> required "name" string
--         |> required "infoURL" string
--         |> required "wikiURL" string
--         |> required "countryCode" string
--
-- decodeSomething0Rocket : Json.Decode.Decoder Something0Rocket
-- decodeSomething0Rocket =
--     decode Something0Rocket
--         |> required "id" int
--         |> required "name" string
--         |> required "configuration" string
--         |> required "familyname" string
--         |> required "agencies" (Json.Decode.list decodeComplexType)
--         |> required "wikiURL" string
--         |> required "infoURLs" (Json.Decode.list Json.Decode.string)
--         |> required "infoURL" string
--         |> required "imageSizes" (Json.Decode.list Json.Decode.int)
--         |> required "imageURL" string
--
-- decodeSomething0 : Json.Decode.Decoder Something0
-- decodeSomething0 =
--     decode Something0
--         |> required "id" int
--         |> required "name" string
--         |> required "windowstart" string
--         |> required "windowend" string
--         |> required "net" string
--         |> required "wsstamp" int
--         |> required "westamp" int
--         |> required "netstamp" int
--         |> required "isostart" string
--         |> required "isoend" string
--         |> required "isonet" string
--         |> required "status" int
--         |> required "inhold" int
--         |> required "tbdtime" int
--         |> required "vidURLs" (Json.Decode.list Json.Decode.string)
--         |> required "vidURL" (Json.Decode.maybe decodeComplexType)
--         |> required "infoURLs" (Json.Decode.list decodeComplexType)
--         |> required "infoURL" (Json.Decode.maybe decodeComplexType)
--         |> required "holdreason" (Json.Decode.maybe decodeComplexType)
--         |> required "failreason" (Json.Decode.maybe decodeComplexType)
--         |> required "tbddate" int
--         |> required "probability" int
--         |> required "hashtag" (Json.Decode.maybe decodeComplexType)
--         |> required "location" (decodeSomething0Location)
--         |> required "rocket" (decodeSomething0Rocket)
--         |> required "missions" (Json.Decode.list decodeComplexType)
--
-- encodeSomething : Something -> Json.Encode.Value
-- encodeSomething record =
--     Json.Encode.object
--         [ ("0",  encodeSomething0 <| record.0)
--         ]
--
-- encodeSomething0Location : Something0Location -> Json.Encode.Value
-- encodeSomething0Location record =
--     Json.Encode.object
--         [ ("pads",  Json.Encode.list <| List.map encodeComplexType <| record.pads)
--         , ("id",  Json.Encode.int <| record.id)
--         , ("name",  Json.Encode.string <| record.name)
--         , ("infoURL",  Json.Encode.string <| record.infoURL)
--         , ("wikiURL",  Json.Encode.string <| record.wikiURL)
--         , ("countryCode",  Json.Encode.string <| record.countryCode)
--         ]
--
-- encodeSomething0Rocket : Something0Rocket -> Json.Encode.Value
-- encodeSomething0Rocket record =
--     Json.Encode.object
--         [ ("id",  Json.Encode.int <| record.id)
--         , ("name",  Json.Encode.string <| record.name)
--         , ("configuration",  Json.Encode.string <| record.configuration)
--         , ("familyname",  Json.Encode.string <| record.familyname)
--         , ("agencies",  Json.Encode.list <| List.map encodeComplexType <| record.agencies)
--         , ("wikiURL",  Json.Encode.string <| record.wikiURL)
--         , ("infoURLs",  Json.Encode.list <| List.map Json.Encode.string <| record.infoURLs)
--         , ("infoURL",  Json.Encode.string <| record.infoURL)
--         , ("imageSizes",  Json.Encode.list <| List.map Json.Encode.int <| record.imageSizes)
--         , ("imageURL",  Json.Encode.string <| record.imageURL)
--         ]
--
-- encodeSomething0 : Something0 -> Json.Encode.Value
-- encodeSomething0 record =
--     Json.Encode.object
--         [ ("id",  Json.Encode.int <| record.id)
--         , ("name",  Json.Encode.string <| record.name)
--         , ("windowstart",  Json.Encode.string <| record.windowstart)
--         , ("windowend",  Json.Encode.string <| record.windowend)
--         , ("net",  Json.Encode.string <| record.net)
--         , ("wsstamp",  Json.Encode.int <| record.wsstamp)
--         , ("westamp",  Json.Encode.int <| record.westamp)
--         , ("netstamp",  Json.Encode.int <| record.netstamp)
--         , ("isostart",  Json.Encode.string <| record.isostart)
--         , ("isoend",  Json.Encode.string <| record.isoend)
--         , ("isonet",  Json.Encode.string <| record.isonet)
--         , ("status",  Json.Encode.int <| record.status)
--         , ("inhold",  Json.Encode.int <| record.inhold)
--         , ("tbdtime",  Json.Encode.int <| record.tbdtime)
--         , ("vidURLs",  Json.Encode.list <| List.map Json.Encode.string <| record.vidURLs)
--         , ("vidURL",  Json.Encode.maybe <| encodeComplexType <| record.vidURL)
--         , ("infoURLs",  Json.Encode.list <| List.map encodeComplexType <| record.infoURLs)
--         , ("infoURL",  Json.Encode.maybe <| encodeComplexType <| record.infoURL)
--         , ("holdreason",  Json.Encode.maybe <| encodeComplexType <| record.holdreason)
--         , ("failreason",  Json.Encode.maybe <| encodeComplexType <| record.failreason)
--         , ("tbddate",  Json.Encode.int <| record.tbddate)
--         , ("probability",  Json.Encode.int <| record.probability)
--         , ("hashtag",  Json.Encode.maybe <| encodeComplexType <| record.hashtag)
--         , ("location",  encodeSomething0Location <| record.location)
--         , ("rocket",  encodeSomething0Rocket <| record.rocket)
--         , ("missions",  Json.Encode.list <| List.map encodeComplexType <| record.missions)
--         ]
