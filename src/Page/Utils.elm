module Page.Utils exposing (..)

import Html exposing (div, text, ul, li, table, tr, td)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Msgs exposing (Msg(..))
import Models exposing (Resource(..))

header outerClass =
    div [ class (outerClass) ]
        [ div [ class "py3 max800 clearfix mx-auto" ]
            [ div [ class "left" ] 
                [ div [ class "h5 bold caps" ]
                    [ text "Petrichor" ] ]
            , div [ class "right" ]
                [ ul [ class "p0 m0" ]
                    [ li [ class "pointer inline-block ml2", onClick (FetchData (EventResource "about")) ]
                        [ text "About" ] ] ] ] ]

footer outerClass =
    div [ class (outerClass) ]
        [ div [ class "py3 max800 clearfix mx-auto" ]
            [ div [ class "h5 bold caps" ]
                [ text "Copyright 2017 IIT Palakkad" ] ] ]


inNav active = 
    div [ class "mb3 clearfix" ]
        [ div [ class (inNavClass active "events"), onClick (FetchData EventsResource) ]
            [ text "Events" ]
        , div [ class (inNavClass active "workshops"), onClick (FetchData WSResource) ]
            [ text "Workshops" ]
        , div [ class (inNavClass active "timeline"), onClick (FetchData TimelineResource) ]
            [ text "Timeline" ] ]

inNavClass x y =
    if x == y then
        "h5 bold caps left mr3 p1 border-bottom"
    else
        "non-active-nav h5 bold caps p1 left mr3 pointer"

cardImageUrl uid =
    "https://adithyaov.github.io/petrichor-files/data/" ++ uid ++ "/card.jpg"

bgImageUrl uid =
    "https://adithyaov.github.io/petrichor-files/data/" ++ uid ++ "/background.jpg"

eventCard uid =
    div [ class "pointer card bg-cover bg-center left bg-white black mr2 mb2"
        , style [ ("background-image", "url(\"" ++ (cardImageUrl uid) ++ "\")") ]
        , onClick (FetchData (EventResource uid)) ]
        [ ]

eventCards objs =
    List.map (\x -> eventCard x.uid ) objs

parseSectionBody method body =
    if method == "table" then
        [ table []
            (makeTable [] body) ]
    else
        List.map
            (\x ->
                div []
                    [ text x ]) body

makeTable accumlator body =
    case body of
        a::b::rest ->
            let
                adduct =
                    tr []
                        [ td []
                            [ text a ]
                        , td [ class "pl2" ]
                            [ text b ] ]
            in      
                makeTable (accumlator ++ [ adduct ]) rest
        _ -> accumlator