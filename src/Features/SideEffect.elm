module Features.SideEffect exposing (featSideEffect)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featSideEffect =
    Feature "Side Effect"
        """
        DeferAction, Promise and IO help manage side effects in functional-style way.
        """
        [ -- 0
          [ p []
                [ text "To be added"
                ]
          , codeShow """
    // To be added
    """
          ]
        ]

