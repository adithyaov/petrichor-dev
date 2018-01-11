module Page.Loading exposing (..)

import Html exposing (div, text, img)
import Html.Attributes exposing (class, src, style)
import Page.Utils exposing (header, footer, inNav, parseSectionBody)

view outerClass =
    div []
        [ header outerClass
        , mainView outerClass
        , (footer outerClass) ]

mainView outerClass =
    div []
        [ div [ class outerClass ]
            [ div [ class "py3 max800 mx-auto" ]
                [ (inNav "none") ] ]
        , (loader) ]

loader =
    div [ class "py3 max800 mx-auto" ]
        [ div [ class "center" ]
            [ div 
                [ class "loding-img bg-cover bg-center bg-white clearfix overflow-hidden mx-auto"
                , style [ ("background-image", "url(\" " ++ loaderImg ++ " \")") ] ]
                [] ] ]

loaderImg =
    "https://adithyaov.github.io/petrichor-files/loading.jpg"