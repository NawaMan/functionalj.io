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
import Features.StructTypes exposing (..)
import Features.StreamIterator exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import Msg exposing (..)


intiFeature =
    featFunctions


exampleView : Feature -> Int -> Html Msg
exampleView feature index =
    exampleAt index feature.examples


markSelect : Int -> Int -> String -> String -> String
markSelect index selected prefix text =
    if index == selected then
        prefix ++ " " ++ text

    else
        prefix


exampleDot index selected =
    span
        [ class (markSelect index selected "example-dot" "selected-example")
        , onClick (SelectExample index)
        ]
        [ text "*"
        ]


exampleSelector : Int -> Int -> Html Msg
exampleSelector selected all =
    div [ class "example-selector" ]
        (List.range 0 (all - 1)
            |> List.map (\index -> exampleDot index selected)
        )


featureExampleView : Feature -> Int -> List (Html Msg)
featureExampleView feature exampleIndex =
    [ h1 [] [ text feature.title ]
    , exampleView feature exampleIndex
    , exampleSelector exampleIndex (List.length feature.examples)
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
