module Features.PipeablePipeLine exposing (description, examplePipe, examplePipeLine, featPipeablePipeLine, title)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featPipeablePipeLine =
    Feature title
        description
        [ examplePipe
        , examplePipeLine
        ]


title =
    "Pipeable and PipeLine"


description =
    """
        Pipeable makes any data pipeable through a function flow.
        PipeLine lets functions be composed together to be used as one function.
      """


examplePipe =
    Example "Pipe object through functions"
        [ p [] [ text "Pipe any object thought functions" ]
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


examplePipeLine =
    Example "PipeLine can be created in advance"
        [ p [] [ text "" ]
        , codeShow """
var readFile = PipeLine
      .of  (String.class)
      .then(Paths ::get)
      .then(Files ::readAllBytes)
      .then(String::new)
      .thenReturn();
...
var fileNames = FuncList.of("file1.txt", "file2.txt");
var fileContent = fileNames.map(readFile);
"""
        ]
