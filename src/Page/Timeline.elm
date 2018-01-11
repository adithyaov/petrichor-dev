module Page.Timeline exposing (..)

import Html exposing (div, text, ul, li)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Page.Utils exposing (header, footer, inNav, parseSectionBody)

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
                (timelineDisplay result) ] ]

timelineDisplay result = 
    List.map
        (\x ->
            div [ class "timeline-box white rounded mb2 p2 overflow-hidden" ]
                [ div [ class "h5 bold caps mb1 red" ]
                    [ text ( x.date ++ ", " ++ x.time ++ ", " ++ x.place ) ]
                , (displaySection x.section) ] ) result

displaySection section =
    div []
        [ div [ class "h5 bold caps mb1 black" ]
            [ text (section.title) ]
        , div [ class "black" ]
            (parseSectionBody section.parseMethod section.body) ]