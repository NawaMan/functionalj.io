module Features.Functions exposing (featFunctions)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featFunctions =
    Feature "Functions"
        """
    More function types and many ways to manipulate and use them.
    """
        [ exampleMethodReference
        , exampleWhenAbsent
        , exampleSafely
        ]


title =
    "Functions"


description =
    """
    More function types and many ways to manipulate and use them.
    """


exampleMethodReference =
    Example "Function from method refernece"
        [ p [] [ text "Since functions are functional interfaces, Java 8 method references can be used to create function." ]
        , codeShow """
public int toInt(String str) {
return Integer.parseInt(str);
}

...
val toInt = (Func1<String, Integer>)this::toInt;
assertEquals(42, (int)toInt.apply("42"));
...
"""
        ]


exampleWhenAbsent =
    Example "Recover from Absent"
        [ p []
            [ code [] [ text "whenAbsentUse(...)" ]
            , text " method let you specify what to return if the result of the function is absent (null or exception)."
            ]
        , codeShow """
import static functionalj.function.Func.f;

public List<String> readLines(String fileName) throws IOException {
    return Files.readAllLines(Paths.get(fileName));
}

    ...
    val readLines = f(this::readLines).whenAbsentUse(FuncList.empty());
    val lines     = readLines.apply("FileNotFound.txt");
    assertEquals("[]", lines.toString());
    ...
"""
        ]


exampleSafely =
    Example "Call method safely"
        [ p []
            [ text "Function body can throw an exception and function can be converted to return "
            , code [] [ text "Result" ]
            , text " using method "
            , code [] [ text "safely()" ]
            , text "."
            ]
        , codeShow """
var readLines = f(this::readLines).safely();
var lines     = readLines.apply("FileNotFound.txt");
assertEquals(
    "Result:{ Exception: java.nio.file.NoSuchFileException: FileNotFound.txt }",
    lines.toString());
"""
        ]
