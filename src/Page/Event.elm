module Page.Event exposing (..)

import Html exposing (div, text, ul, li, table, tr, td)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)

import Page.Utils exposing (header, footer, inNav, eventCards, parseSectionBody, bgImageUrl)

import Msgs exposing (Msg(..))
import Models exposing (Resource(..))

view status =
    case status of
        Err e ->
            div [] [ text (toString e) ]
        Ok result ->
            properView result

properView result =
    div [ class "bg-cover bg-center wrapper bg-black clearfix fixed top-0 left-0 overflow-auto"
        , style [ ("background-image", "url(\"" ++ (bgImageUrl (result.uid)) ++ "\")") ] ]
        [ div [] 
            [ div 
                [ class "btn caps border border-white m2 white p2"
                , onClick (FetchData EventsResource) ] 
                [ text "Go back" ] ] 
        , div []
             [ div [ class "py3 max800 mx-auto white" ]
                [ div [ class "h1 bold caps tshadow" ]
                    [ text (result.name) ]
                , div []
                    (displaySections (result.sections)) ] ]
        , (registerBtn result.paymentLink)
        , (footer "white") ]


registerBtn reglink =
    case reglink of
        "none" ->
            div []
                []
        _ -> 
            div []
                [ div [ class "max800 mx-auto" ]
                    [ div [ class "bg-green border border-white caps white p2 btn" ]
                        [ text "Register" ] ] ]


displaySections sections =
    List.map 
        (\x -> 
            div [ class "section mt3 bg-white black rounded p2" ]
                [ div [ class "h5 bold caps mb1" ]
                    [ text (x.title) ]
                , div []
                    (parseSectionBody x.parseMethod x.body) ]) sections


