module Features.Result exposing (featResult)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featResult =
    Feature title
        description
        [ exampleHandleException
        , exampleValidation
        , exampleAcceptable
        ]


title =
    "Result"


description =
    """
        Boxed object similar to MayBe or Either types.
        Result is designed to work well with Java exception.
      """


exampleHandleException =
    Example "Handle Exception"
        [ p [] [ text "Handle exception gracefully. The code below will return wordCount as 0 but will print out a file not found exception." ]
        , codeShow """
val wordCount
        = Result.of(()->Files.readAllBytes(Paths.get("FileNotFound.txt")))
        .map(String::new)
        .map(matches("[a-zA-Z]+"))
        .map(Stream::count)
        .ifException(Exception::printStackTrace)
        .orElse(0L)
        ;
assertEquals(0L, wordCount.longValue());
"""
        ]


exampleValidation =
    Example "Validate value"
        [ p [] [ text "Validation can be built in to the flow. More complex exception can also be done." ]
        , codeShow """
val result1
        = Result.valueOf("One Two Three Four Five Six")
        .map(matches("[a-zA-Z]+"))
        .map(Stream::count)
        .validate("Too few words: %d", count -> count > 5)
        ;
assertEquals("Result:{ Value: 6 }", result1.toString());

val result2
        = Result.valueOf("One Two Three Four")
        .map(matches("[a-zA-Z]+"))
        .map(Stream::count)
        .validate("Too few words: %d", count -> count > 5)
        ;
assertEquals("Result:{ Invalid: Too few word: 4 }", result2.toString());
"""
        ]


exampleAcceptable =
    Example "Acceptable"
        [ p [] [ text "Acceptable (a sub-class of Result) can have validation built into a type." ]
        , codeShow """
// Type of three-digit string.
public class ThreeDigitString extends Acceptable<String> {
    public ThreeDigitString(String value) {
        super(value, Validation.ToBoolean(str -> str.matches("^[0-9]{3}$"), "Three digit string is required."));
    }
}
...

assertTrue (new ThreeDigitString("123").isPresent());
assertFalse(new ThreeDigitString("12") .isPresent());
assertFalse(new ThreeDigitString("ABC").isPresent());
assertFalse(new ThreeDigitString(null) .isPresent());
"""
        ]
