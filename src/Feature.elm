module Feature exposing (Example, Feature, codeShow, exampleBodyAt, exampleTitleAt)

import CodeBlock exposing (codeBlock)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)
import Msg exposing (..)


type alias Feature =
    { title : String
    , description : String
    , examples : List Example
    }


type alias Example =
    { title : String
    , body : List (Html Msg)
    }


emptyExample =
    Example "" [ text "" ]


exampleTitleAt : Int -> List Example -> String
exampleTitleAt index examples =
    (Maybe.withDefault emptyExample (List.head (List.drop index examples))).title


exampleBodyAt : Int -> List Example -> Html Msg
exampleBodyAt index examples =
    div []
        (Maybe.withDefault emptyExample (List.head (List.drop index examples))).body


codeShow codeText =
    codeBlock (String.trim codeText)
