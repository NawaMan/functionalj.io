module Features.AlgebraicDataTypes exposing (featAlgebraicDataTypes)

import CodeBlock exposing (codeBlock)
import Feature exposing (Example, Feature, codeShow)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featAlgebraicDataTypes =
    Feature title
        description
        [ firstExample ]


title =
    "Algebraic Data Types"


description =
    """
        Struct (product) and Choice (sum) types together work as algebraic data types
          make it easier to make illegal data unrepresentable.
      """


firstExample =
    Example "ToBeAdded"
        [ p [] [ text "To be added" ]
        , codeShow """
// To be added
"""
        ]
