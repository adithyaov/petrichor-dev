module Commands exposing (..)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)

import Msgs
import Models exposing (..)

fetchEventsUrl = "https://adithyaov.github.io/petrichor-files/events.json"
fetchWSUrl = "https://adithyaov.github.io/petrichor-files/workshops.json"
fetchTimelineUrl = "https://adithyaov.github.io/petrichor-files/timeline.json"
fetchEventUrl uid = "https://adithyaov.github.io/petrichor-files/data/" ++ uid ++ "/main.json"

fetchEventsCmd =
    Http.get fetchEventsUrl cardsDecoder
    |> Http.send (\x -> Msgs.ChangeRoute (EventRoute x))

fetchWSCmd =
    Http.get fetchWSUrl cardsDecoder
    |> Http.send (\x -> Msgs.ChangeRoute (WSRoute x))

fetchTimelineCmd =
    Http.get fetchTimelineUrl timelineDecoder
    |> Http.send (\x -> Msgs.ChangeRoute (TimelineRoute x))

fetchEventCmd uid =
    Http.get (fetchEventUrl uid) eventDecoder
    |> Http.send (\x -> Msgs.ChangeRoute (DisplayEvent x))

eventDecoder =
    decode Event
        |> required "name" Decode.string
        |> required "uid" Decode.string
        |> required "sections" (Decode.list sectionDecoder)
        |> required "paymentLink" Decode.string

cardsDecoder =
    Decode.list cardDecoder

cardDecoder =
    decode EventCard
        |> required "uid" Decode.string

timelineDecoder =
    Decode.list timelineElementDecoder

timelineElementDecoder = 
    decode TimelineElement
        |> required "date" Decode.string
        |> required "time" Decode.string
        |> required "place" Decode.string
        |> required "section" sectionDecoder

sectionDecoder = 
    decode Section
        |> required "title" Decode.string
        |> optional "parseMethod" Decode.string "post"
        |> required "body" (Decode.list Decode.string)