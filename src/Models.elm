module Models exposing (..)

type alias Model =
    { route : Route
    }

initModel : Model
initModel =
    { route = HomeRoute
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
    = HomeRoute
    | EventRoute (List EventCard)
    | WSRoute (List EventCard)
    | ScheduleRoute (Timeline)
    | DisplayEvent (Event)
    | AboutRoute

type Resource
    = EventsReource
    | WSResource
    | EventResource String
    | TimelineResource