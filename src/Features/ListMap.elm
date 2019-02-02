module Features.ListMap exposing (featListMap)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featListMap =
    Feature title
        description
        [ firstExample ]


title =
    "Functional List and Map"


description =
    """
      Functional lazy-evaluated list and map.
      This allows access functional methods right with list and map.
      """


firstExample =
    Example "ToBeAdded"
        [ p [] [ text "To be added" ]
        , codeShow """
// To be added
"""
        ]
