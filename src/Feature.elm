module Feature exposing (Feature, codeShow, exampleAt)

import Msg exposing (..)
import CodeBlock exposing (codeBlock)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


type alias Feature =
    { title : String
    , description : String
    , examples : List (List (Html Msg))
    }


exampleAt index examples =
    div []
        (Maybe.withDefault [ text "" ] (List.head (List.drop index examples)))


codeShow codeText =
    codeBlock (String.trim codeText)

