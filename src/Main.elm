module Main exposing (main)

import Browser
import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Features exposing (..)
import Html exposing (Html, a, button, code, div, h1, img, p, pre, span, text)
import Html.Attributes exposing (class, href, id, name, src)
import Html.Events exposing (onClick)
import Introduction exposing (introduction, introductionView)
import Msg exposing (..)
import Random


type Usage
    = Gradle
    | Maven


type alias Model =
    { usage : Usage
    , feature : Feature
    , exampleIndex : Int
    }


requestRandomFeature : Cmd Msg
requestRandomFeature =
    Random.generate SelectFeature (Random.int 0 (List.length features - 1))


requestRandomExample : Feature -> Cmd Msg
requestRandomExample feature =
    Random.generate SelectExample (Random.int 0 (List.length feature.examples - 1))


featureAt : Int -> Feature
featureAt index =
    Maybe.withDefault intiFeature (List.head (List.drop index features))


initialModel : flag -> ( Model, Cmd Msg )
initialModel flag =
    ( { usage = Gradle
      , feature = intiFeature
      , exampleIndex = 0
      }
    , requestRandomFeature
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectFeature index ->
            let
                newFeature =
                    featureAt index
            in
            ( { model | feature = newFeature }
            , requestRandomExample newFeature
            )

        SelectExample index ->
            ( { model | exampleIndex = index }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    div []
        [ div [ id "top-bar" ] [ topBar ]
        , div [ id "body" ]
            [ firstSection
            , sectionIntroduction
            , sectionFeatures model
            , sectionExamples model
            , sectionUsages
            , sectionBottom
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    -- Browser.application
    Browser.element
        { init = initialModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


topBar : Html Msg
topBar =
    div []
        [ a [ href "https://github.com/NawaMan/FunctionalJ" ]
            [ img [ id "github-ribbon", src "github-ribbon.png" ] []
            ]
        ]


firstSection : Html Msg
firstSection =
    div [ class "section section-first" ]
        [ div [ class "content" ] [ text "FunctionaJ" ]
        ]


sectionIntroduction : Html Msg
sectionIntroduction =
    div [ class "section section-introduction" ]
        [ introductionView ]


sectionFeatures : Model -> Html Msg
sectionFeatures model =
    div [ class "section section-features" ]
        [ h1 [ class "center" ] [ text "Features" ]
        , a [ name "features", class "features" ]
            (List.indexedMap (\index -> featureView index model.feature) features)
        , p [ class "center" ] [ text "Click on any feature to see example below." ]
        ]


sectionExamples : Model -> Html Msg
sectionExamples model =
    div [ class "section section-examples" ]
        (featureExampleView model.feature model.exampleIndex)


useGradle : Html Msg
useGradle =
    div []
        [ p []
            [ text "This project binary is published on "
            , a [ href "https://github.com/NawaMan/nawaman-maven-repository" ]
                [ text "my maven repo"
                ]
            , text " hosted on GitHub. So to use FunctionalJ you will need to ..."
            ]
        , p [] [ text "Add the maven repository ..." ]
        , codeBlock "maven { url 'https://raw.githubusercontent.com/nawmaman/nawaman-maven-repository/master/' }"
        , p [] [ text "and the dependencies to FunctionalJ." ]
        , codeBlock "compile 'functionalj:functionalj-all:0.1.60.0' // Please lookup for the latest version."
        ]


sectionUsages : Html Msg
sectionUsages =
    div [ class "section section-usages" ]
        [ h1 [] [ text "Usages" ]
        , useGradle
        ]


sectionBottom : Html Msg
sectionBottom =
    div [ class "section section-bottom" ]
        [ p [] [ text "© 2017-2019 NawaMan's FunctionalJ — FunctionalJ is Open Source, Apache 2 License" ]
        , p []
            [ text "Find code on "
            , a [ href "https://github.com/NawaMan/FunctionalJ" ] [ text "GitHub" ]
            ]
        ]
