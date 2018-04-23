module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { triplanns : WebData (List Triplann)
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { triplanns = RemoteData.Loading
    , route = route
    }


type alias TriplannId =
    String


type alias Triplann =
    { id : TriplannId
    , name : String
    , level : Int
    }


type Route
    = TriplannsRoute
    | TriplannRoute TriplannId
    | NotFoundRoute
