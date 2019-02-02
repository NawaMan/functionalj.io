module Features.StreamIterator exposing (featStreamIterator)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featStreamIterator =
    Feature title
        description
        [ firstExample ]


title =
    "Stream and Iterator"


description =
    """
      Additional functionalities to Streams and Iterator.
      """


firstExample =
    Example "ToBeAdded"
        [ p [] [ text "To be added" ]
        , codeShow """
// To be added
"""
        ]
