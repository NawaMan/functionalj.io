module Main exposing (main)

import Browser
import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Features exposing (..)
import References exposing (..)
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
            ( { model | feature = newFeature, exampleIndex = 0 }
            , requestRandomExample newFeature
            )

        SelectExample index ->
            ( { model | exampleIndex = index }
            , Cmd.none
            )

        ChooseGradle ->
            ( { model | usage = Gradle }
            , Cmd.none
            )

        ChooseMaven ->
            ( { model | usage = Maven }
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
            , sectionReferences model
            , sectionUsages model
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
        [ div [ class "content" ] [ text "FunctionalJ" ]
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
        , p [ class "center" ] [ text "Click on any feature to see examples below." ]
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
            , text " hosted on GitHub. So to use FunctionalJ.io you will need to ..."
            ]
        , p [] [ text "Add the maven repository ..." ]
        , codeBlock "maven { url 'https://raw.githubusercontent.com/nawmaman/nawaman-maven-repository/master/' }"
        , p [] [ text "and the dependencies to FunctionalJ.io." ]
        , codeBlock "compile 'functionalj:functionalj-all:0.1.69.0' // Please lookup for the latest version."
        , p []
            [ a [ href "https://github.com/NawaMan/UseFunctionalJGradle" ] [ text "UseFunctionalJGradle" ]
            , text " is an example project that use FunctionalJ.io. You can use that as a starting point."
            ]
        ]


useMaven : Html Msg
useMaven =
    div []
        [ p []
            [ text "This project binary is published on "
            , a [ href "https://github.com/NawaMan/nawaman-maven-repository" ]
                [ text "my maven repo"
                ]
            , text " hosted on GitHub. So to use FunctionalJ.io you will need to ..."
            ]
        , p [] [ text "Adding the required maven repository (hosted by github)." ]
        , codeBlock """
<repository>
    <id>Nullable-mvn-repo</id>
    <url>https://raw.githubusercontent.com/nawaman/nawaman-maven-repository/master/</url>
    <snapshots>
        <enabled>true</enabled>
        <updatePolicy>always</updatePolicy>
    </snapshots>
</repository>
        """
        , p [] [ text "and the dependencies to FunctionalJ.io." ]
        , codeBlock """
    <dependency>
        <groupId>functionalj</groupId>
        <artifactId>functionalj-all</artifactId>
        <version>0.1.69.0</version>
    </dependency>
        """
        , p []
            [ a [ href "https://github.com/NawaMan/UseFunctionalJMaven" ] [ text "UseFunctionalJMaven" ]
            , text " is an example project that use FunctionalJ.io. You can use that as a starting point."
            ]
        ]


sectionUsages : Model -> Html Msg
sectionUsages model =
    div [ class "section section-usages" ]
        [ h1 [] [ text "Usages" ]
        , div [ class "usage-selector" ]
            [ button [ onClick ChooseGradle ] [ text "GRADLE" ]
            , button [ onClick ChooseMaven ] [ text "MAVEN" ]
            ]
        , case model.usage of
            Gradle ->
                useGradle

            Maven ->
                useMaven
        ]


sectionReferences : Model -> Html Msg
sectionReferences model = referencesView


sectionBottom : Html Msg
sectionBottom =
    div [ class "section section-bottom" ]
        [ p []
            [ text "© 2017-2019 NawaMan's FunctionalJ.io — FunctionalJ.io is Open Source, "
            , a [ href "https://github.com/NawaMan/FunctionalJ/blob/master/LICENSE" ] [ text "MIT License" ]
            , text "."
            ]
        , p []
            [ text "Find code on "
            , a [ href "https://github.com/NawaMan/FunctionalJ" ] [ text "GitHub" ]
            ]
        , p []
            [ text "SonaType OSSRH-49288"
            ]
        ]

        
