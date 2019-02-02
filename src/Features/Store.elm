module Features.Store exposing (featStore)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featStore =
    Feature title
        description
        [ firstExample ]


title =
    "Store"


description =
    """
      Simple object helps manage changes for immutable data.
      """


firstExample =
    Example "ToBeAdded"
        [ p [] [ text "To be added" ]
        , codeShow """
// To be added
"""
        ]
