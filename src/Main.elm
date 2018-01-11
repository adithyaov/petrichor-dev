module Main exposing (..)

import Html exposing (Html, div, text, program)
import Models exposing (Model, initModel, Route(..), Resource(..))
import Update exposing (update)
import Msgs exposing (Msg(..))
import Commands exposing (..)
import Page.Events
import Page.Event
import Page.Timeline
import Page.Loading

-- MODEL



init : ( Model, Cmd Msg )
init =
    ( initModel, fetchEventsCmd )



-- VIEW


view : Model -> Html Msg
view model =
    case model.route of
        EventRoute x -> Page.Events.view "bg-orange white" "events" x
        WSRoute x -> Page.Events.view "bg-blue white" "workshops" x
        DisplayEvent x -> Page.Event.view x
        TimelineRoute x -> Page.Timeline.view "bg-red white" "timeline" x
        LoadingRoute -> Page.Loading.view "bg-white black"




-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }