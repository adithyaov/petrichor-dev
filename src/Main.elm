module Main exposing (..)

import Html exposing (Html, div, text, program)
import Models exposing (Model, initModel, Route(..), Resource(..))

-- MODEL



init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



-- MESSAGES


type Msg
    = NoOp
    | ChangeRoute Route
    | FetchData Resource


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text "Hello" ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
        ChangeRoute route ->
            ( { model | route = route }, Cmd.none )
        FetchData resource ->
            ( model, Cmd.none )



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