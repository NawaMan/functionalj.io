module Features.Functions exposing (featFunctions)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text, a)
import Html.Attributes exposing (class, id, href)


featFunctions =
    Feature "Functions"
        """
    More function types and many ways to manipulate and use them.
    """
        [ exampleMethodReference
        , exampleWhenAbsent
        , exampleSafely
        , examplePartialApplication
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
...
import functionalj.function.Func.f;
...

public int toInt(String str) {
    return Integer.parseInt(str);
}
public static int toIntWithBase(String str, int base) {
    return Integer.parseInt(str, base);
}

...

// Since functions are functional interfaces,
//     Java 8 method references can be used to create functions.

// With FunctionalJ, the `Func.f` method allows you to easily turn a method reference to a function.
var toInt = f(Main::toInt);
validate("toInt.apply(\"42\") = 42",
          toInt.apply("42"),  42);

// It also automatically takes are of the types.
// Notice that we use `f` for both `toInt` and `toIntWithBase` which have different signature.
var toIntWithBase = f(Main::toIntWithBase);
validate("toIntWithBase.apply(\"11\", 9) = 9",
          toIntWithBase.apply("11", 8),  9);

// As a function object, we can use it as such. Like with `andThen()`.
validate("f(Main::toInt).andThen(i -> i + 8).apply(\"42\") = 50",
          f(Main::toInt).andThen(i -> i + 8).apply("42"),  50);
...
"""
        , p [] [
            text "Try it out for your self "
            , a [ href "https://replit.com/@NawaMan/TryFunctionalJ-Function-from-method-reference#src/main/java/main/Main.java" ] [ text "here" ]
            , text "!!!"
            ]
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


examplePartialApplication =
    Example "Partial application"
        [ p []
            [ text "There is a number of ways to do parial applications. Here we use method bind to do that. "
            , text "In the following code a function query is create from queryDB with all the connection information partiallt applied but the sqlStatement left to the applied later."
            ]
        , codeShow """
var queryDB = f((String jdbcUrl, String userName, String passWord, String sqlStatement) -> .....));
...
import static functionalj.function.Absent.__;
var query = queryDB.bind(url, uname, passwd, __);
"""
        ]
