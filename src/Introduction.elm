module Introduction exposing (introduction, introductionView)

import Html exposing (Html, div, text)


-- Add as required by elm build 
main =
  Html.text "Hello!"



introductionView : Html msg
introductionView = div [] [ text introduction ]


introduction =
    """
FunctionalJ.io is a library for writing functional style code in Java.
It aims be a practical expansion to functional programming added in Java 8.
FunctionalJ.io is a pure Java library with all code written in Java
  so its usages will be just like other Java library.
No additional build steps or tools are required outside of adding dependencies.
FuncionalJ.io works with Java 8 and up.
"""
