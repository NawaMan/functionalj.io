module Features.Ref exposing (featRef)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featRef =
    Feature "Ref - Dependency Injection"
        """
        Ref (reference) enables instance-base context and dependency injection as oppose to class/annotation-base one.
        This is very suitable to functional programming.
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

