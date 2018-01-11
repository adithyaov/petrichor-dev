module Models exposing (..)

import Http

type alias Model =
    { route : Route
    }

initModel : Model
initModel =
    { route = LoadingRoute
    }

type alias EventCard =
    { uid : String
    }

type alias Event =
    { name : String
    , uid : String
    , sections : List Section
    , paymentLink : String
    }

type alias Section =
    { title : String
    , parseMethod: String
    , body : List String 
    }

type alias Timeline =
    List TimelineElement

type alias TimelineElement =
    { date : String
    , time : String
    , place : String
    , section : Section
    }

type Route
    = LoadingRoute
    | EventRoute (Result (Http.Error) (List EventCard))
    | WSRoute (Result (Http.Error) (List EventCard))
    | TimelineRoute (Result (Http.Error) (Timeline))
    | DisplayEvent (Result (Http.Error) (Event))

type Resource
    = EventsResource
    | WSResource
    | EventResource String
    | TimelineResource