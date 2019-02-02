module Features.ListMap exposing (featListMap)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featListMap =
    Feature title
        description
        [ exampleFunctionalMethods
        , exampleImmutableModification
        ]


title =
    "Functional List and Map"


description =
    """
      Functional lazy-evaluated list and map.
      This allows access functional methods right with list and map.
      """


exampleFunctionalMethods =
    Example "Functional Methods"
        [ p [] [ text "FuncList and FuncMap has functional methods" ]
        , codeShow """
var list = FuncList.of("I", "Me", "Myself");
var map  = FuncMap .of("One", 1.0, "PI", 3.14159, "E", 2.71828);

assertEquals("[1, 2, 6]",          list.map(String::length).toString());
assertEquals("{One:1, PI:3, E:3}", map .map(Math::round)   .toString());
"""
        ]


exampleImmutableModification =
    Example "Immutable Modification"
        [ p [] [ text "FuncList and FuncMap cannot be changed in place but you can create new list/map with the changes." ]
        , codeShow """
val list = FuncList.of("I", "Me", "Myself");
val map  = FuncMap .of("One", 1.0, "PI", 3.14159, "E", 2.71828);

val newList = list.append("First-Person");
val newMap  = map .with("Ten", 10.0);

assertEquals("[I, Me, Myself]",                            list.toString());
assertEquals("{One:1.0, PI:3.14159, E:2.71828}",           map .toString());
assertEquals("[I, Me, Myself, First-Person]",              newList.toString());
assertEquals("{One:1.0, PI:3.14159, E:2.71828, Ten:10.0}", newMap .toString());
"""
        ]