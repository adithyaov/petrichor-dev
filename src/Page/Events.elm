module Page.Events exposing (..)

import Html exposing (div, text, ul, li)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Page.Utils exposing (header, footer, inNav, eventCards)

view outerClass active status =
    case status of
        Err e ->
            div [] [ text (toString e) ]
        Ok result ->
            div []
                [ header outerClass
                , mainView outerClass active result
                , footer outerClass ]

mainView outerClass active result =
    div [ class outerClass ]
        [ div [ class "py3 max800 mx-auto" ]
            [ (inNav active)
            , div [ class "clearfix" ]
                (eventCards result) ] ]