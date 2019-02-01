module Features.PipeablePipeLine exposing (..)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featPipeablePipeLine =
    Feature "Pipeable and PipeLine"
        """
        Pipeable makes any data pipeable through a function flow.
        PipeLine lets functions be composed together to be used as one function.
        """
    [ -- 0
      [ p []
            [ text "Access (read-only part of Lens) is a function to get field value of an object."
            ]
      , codeShow """
import static functionalj.functions.StrFuncs.replaceAll;

...
      val str = Pipeable.of("Hello world.").pipe(
                  String::toUpperCase,
                  replaceAll("\\.", "!!")
            );
      assertEquals("HELLO WORLD!!", str);
...
"""
      ]
    ]
