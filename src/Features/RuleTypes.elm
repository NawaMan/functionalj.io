module Features.RuleTypes exposing (featRuleTypes)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featRuleTypes =
    Feature title
        description
        [ firstExample ]


title =
    "Rule Types"


description =
    """
      Rule types make it easy to create type with constrains to limit variant of data.
      """


firstExample =
    Example "ToBeAdded"
        [ p [] [ text "To be added" ]
        , codeShow """
// To be added
"""
        ]
