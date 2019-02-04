module Features.StreamIterator exposing (featStreamIterator)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featStreamIterator =
    Feature title
        description
        [ exampleSegment
        , exampleSplit
        , exampleZipWith ]


title =
    "StreamPlus and IteratorPlus"


description =
    """
      Additional functionalities to Streams and Iterator.
      """


exampleSegment =
    Example "Segment"
        [ p [] [ text "Segmenting stream into chunks - many different ways to do it." ]
        , codeShow """
Predicate<Integer> startCondition = i ->(i % 10) == 3;
Predicate<Integer> endCondition   = i ->(i % 10) == 6;

assertEquals("[[53, 54, 55, 56], " + 
              "[63, 64, 65, 66], " + 
              "[73, 74, 75, 76]]",
        StreamPlus.infiniteInt()
        .segment(startCondition, endCondition)
        .skip   (5)
        .limit  (3)
        .map    (StreamPlus::toListString)
        .toListString());
"""
        ]

exampleSplit =
    Example "Split"
        [ p [] [ text "Split stream into group based on predicates." ]
        , codeShow """
val stream = StreamPlus.infiniteInt().limit(20);
assertEquals("{"
        + "FizzBuzz:[0, 15], "
        + "Buzz:[5, 10], "
        + "Fizz:[3, 6, 9, 12, 18]}", 
        stream
            .split(
                "FizzBuzz", i -> i % (3*5) == 0,
                "Buzz",     i -> i % 5     == 0,
                "Fizz",     i -> i % 3     == 0,
                null)
            .toString());
"""
        ]



exampleZipWith =
    Example "ZipWith"
        [ p [] [ text "ZipWith command two stream into a Stream of tuples." ]
        , codeShow """
val streamA = StreamPlus.of("A", "B", "C");
val streamB = IntStreamPlus.infinite().asStream();
assertEquals("(A,0), (B,1), (C,2)", streamA.zipWith(streamB, RequireBoth).joinToString(", "));
"""
        ]