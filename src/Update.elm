module Update exposing (..)

import Msgs exposing (Msg(..))
import Models exposing (Model, Resource(..))
import Commands exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
        ChangeRoute route ->
            ( { model | route = route }, Cmd.none )
        FetchData resource ->
            ( fetchData resource model )

fetchData resource model =
    case resource of
        EventsResource -> 
            ( model, fetchEventsCmd )
        WSResource -> 
            ( model, fetchWSCmd )
        EventResource uid -> 
            ( model, fetchEventCmd uid )
        TimelineResource -> 
            ( model, fetchTimelineCmd )