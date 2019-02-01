module Features.Store exposing (featStore)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featStore =
    Feature "Store"
        """
        Simple object helps manage changes for immutable data.
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

