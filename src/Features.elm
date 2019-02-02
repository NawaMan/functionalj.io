module Features exposing (exampleDot, exampleSelector, exampleView, featureExampleView, featureView, features, intiFeature, markSelect, markSelection)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Features.AlgebraicDataTypes exposing (..)
import Features.Functions exposing (..)
import Features.Lens exposing (..)
import Features.ListMap exposing (..)
import Features.PipeablePipeLine exposing (..)
import Features.Ref exposing (..)
import Features.Result exposing (..)
import Features.RuleTypes exposing (..)
import Features.SideEffect exposing (..)
import Features.Store exposing (..)
import Features.StreamIterator exposing (..)
import Features.StructTypes exposing (..)
import Html exposing (Html, button, code, div, h1, h3, p, span, text)
import Html.Attributes exposing (class, id, property)
import Html.Events exposing (onClick)
import Json.Encode exposing (string)
import Msg exposing (..)


intiFeature =
    featFunctions


exampleView : Feature -> Int -> Html Msg
exampleView feature index =
    exampleBodyAt index feature.examples


markSelect : Int -> Int -> String -> String -> String
markSelect index selected prefix text =
    if index == selected then
        prefix ++ " " ++ text

    else
        prefix


exampleDot index selected examples =
    let
        title =
            exampleTitleAt index examples
    in
    span
        [ class (markSelect index selected "example-dot" "selected-example")
        , onClick (SelectExample index)
        ]
        [ span [ class "tooltip" ]
            [ span [ class "tooltiptext" ] [ text title ]
            ]
        ]


exampleSelector : Int -> List Example -> Html Msg
exampleSelector selected examples =
    let
        all =
            List.length examples
    in
    div [ class "example-selector" ]
        (List.range 0 (all - 1)
            |> List.map (\index -> exampleDot index selected examples)
        )


featureExampleView : Feature -> Int -> List (Html Msg)
featureExampleView feature exampleIndex =
    [ h1 [ class "example-feature-title" ] [ text feature.title ]
    , exampleSelector exampleIndex feature.examples
    , h3 [ class "example-example-title" ] [ text (exampleTitleAt exampleIndex feature.examples) ]
    , exampleView feature exampleIndex
    ]


markSelection selectedFeature feature =
    if feature.title == selectedFeature.title then
        " select-feature"

    else
        ""


featureView : Int -> Feature -> Feature -> Html Msg
featureView index selectedFeature feature =
    div
        [ class ("feature" ++ markSelection feature selectedFeature)
        , onClick (SelectFeature index)
        ]
        [ div [ class "title" ]
            [ text feature.title
            ]
        , div [ class "description" ] [ text feature.description ]
        ]


features =
    [ featFunctions
    , featLens
    , featPipeablePipeLine
    , featListMap
    , featStreamIterator
    , featResult
    , featAlgebraicDataTypes
    , featRuleTypes
    , featStructTypes
    , featRef
    , featSideEffect
    , featStore
    ]
