module Features.Result exposing (featResult)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featResult =
    Feature title
        description
        [ firstExample ]


title =
    "Result"


description =
    """
        Boxed object similar to MayBe or Either types.
        Result is designed to work well with Java exception.
      """


firstExample =
    Example "ToBeAdded"
        [ p [] [ text "To be added" ]
        , codeShow """
// To be added
"""
        ]
