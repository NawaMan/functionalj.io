module References exposing (referencesView)

import Html exposing (Html, a, b, button, code, div, h1, h3, img, li, p, span, text, ul)
import Html.Attributes exposing (class, href, id, property, src, style, target, width)
import Msg exposing (..)


type alias Article =
    { title : String
    , subTitle : String
    , link : String
    }


type alias Vdo =
    { title : String
    , subTitle : String
    , link : String
    }


articles =
    [ { title = "Introducing FunctionalJ"
      , subTitle = "Adding more functional spice to Java with FunctionalJ."
      , link = "https://nawaman.net/blog/2019-02-12#IntroducingFunctionalJ"
      }
    , { title = "Setup FunctionalJ for Eclipse"
      , subTitle = "Make use of FunctionalJ types with Eclipse IDE."
      , link = "https://nawaman.net/blog/2019-02-26#FunctionalJEclipse"
      }
    , { title = "Immutable Data With FunctionalJ.io"
      , subTitle = "Quick and easy way to create and use immutable data using FunctionalJ.io."
      , link = "https://dzone.com/articles/immutable-data-with-functionalio"
      }
    , { title = "Choice types in Java with FunctionalJ.io"
      , subTitle = "A \"Tagged Union\" implementation in Java."
      , link = "https://dzone.com/articles/choice-types-in-java-with-functionaljio"
      }
    ]


vdos =
    [ { title = "Introducing FunctionalJ"
      , subTitle = "Introducing FunctionalJ library - a library to bring in numbers of functional programming goodness to Java."
      , link = "gIHY1wUSQzs"
      },
      { title = "Setup Eclipse for FunctionalJ"
      , subTitle = "FunctionalJ.io helps writing functional style of code easier in Java. Most of its features work already with Eclipse except for the types. Types use annotation process to generate classes so we need to tell Eclipse to look for these generated classes. This VDO shows how to set up Eclipse so that FunctionalJ's types are visible to Eclipse as you develop."
      , link = "nTOb6r13HvM"
      },
      { title = "Immutable Data with FunctionalJ.io"
      , subTitle = "Immutability is an important principle of functional programming. Mutable objects hide changes. And hidden changes can lead to unpredictability and chaos."
      , link = "Q_cdFh9fhxY"
      },
      { title = "Choice Types in Java with FunctionalJ.io"
      , subTitle = "Choice types allow the specification of possible values in an ad-hoc fasion."
      , link = "JWKl2cfkVrw"
      }
    ]


referencesView : Html Msg
referencesView =
    div [ class "section section-references" ]
        [ h1 [] [ text "References" ]
        , div [ class "list-articles" ]
            [ h3 [] [ text "Articles" ]
            , ul []
                [ li []
                    [ b [] [ text "Introducing FunctionalJ" ]
                    , text " - Adding more functional spice to Java with FunctionalJ. "
                    , a [ href "https://nawaman.net/blog/2019-02-12#IntroducingFunctionalJ", target "_blank" ]
                        [ img [ src "external-link-icon.png" ] [] ]
                    ]
                , li []
                    [ b [] [ text "Setup FunctionalJ for Eclipse" ]
                    , text " - Make use of FunctionalJ types with Eclipse IDE. "
                    , a [ href "https://nawaman.net/blog/2019-02-26#FunctionalJEclipse", target "_blank" ]
                        [ img [ src "external-link-icon.png" ] [] ]
                    ]
                , li []
                    [ b [] [ text "Immutable Data With FunctionalJ.io" ]
                    , text " - Quick and easy way to create and use immutable data using FunctionalJ.io. "
                    , a [ href "https://dzone.com/articles/immutable-data-with-functionalio", target "_blank" ]
                        [ img [ src "external-link-icon.png" ] [] ]
                    ]
                , li []
                    [ b [] [ text "Choice types in Java with FunctionalJ.io" ]
                    , text " - A \"Tagged Union\" implementation in Java "
                    , a [ href "https://dzone.com/articles/choice-types-in-java-with-functionaljio", target "_blank" ]
                        [ img [ src "external-link-icon.png" ] [] ]
                    ]
                , li []
                    [ b [] [ text "Lazy-Evaluated Functional Lists" ]
                    , text " - Haskel Style List in Java With FunctionalJ.io "
                    , a [ href "https://dzone.com/articles/lazy-evaluated-functional-lists", target "_blank" ]
                        [ img [ src "external-link-icon.png" ] [] ]
                    ]
                ]
            ]
        , div [ class "list-vdos" ]
            [ h3 [] [ text "Videos" ]
            , ul []
                [ li []
                    [ p []
                        [ a [ href "https://www.youtube.com/watch?v=gIHY1wUSQzs", target "_blank" ]
                            [ img [ src "https://img.youtube.com/vi/gIHY1wUSQzs/mqdefault.jpg", width 128 ] [] ]
                        , div []
                            [ a [ href "https://www.youtube.com/watch?v=gIHY1wUSQzs", target "_blank" ]
                                [ b [] [ text "Introducing FunctionalJ" ] ]
                            , p [] [ text "Introducing FunctionalJ library - a library to bring in numbers of functional programming goodness to Java." ]
                            ]
                        ]
                    ]
                , li []
                    [ p []
                        [ a [ href "https://www.youtube.com/watch?v=nTOb6r13HvM", target "_blank" ]
                            [ img [ src "https://img.youtube.com/vi/nTOb6r13HvM/mqdefault.jpg", width 128 ] [] ]
                        , div []
                            [ a [ href "https://www.youtube.com/watch?v=nTOb6r13HvM", target "_blank" ]
                                [ b [] [ text "Setup Eclipse for FunctionalJ" ] ]
                            , p [] [ text "FunctionalJ.io helps writing functional style of code easier in Java. Most of its features work already with Eclipse except for the types. Types use annotation process to generate classes so we need to tell Eclipse to look for these generated classes. This VDO shows how to set up Eclipse so that FunctionalJ's types are visible to Eclipse as you develop." ]
                            ]
                        ]
                    ]
                , li []
                    [ p []
                        [ a [ href "https://www.youtube.com/watch?v=Q_cdFh9fhxY", target "_blank" ]
                            [ img [ src "https://img.youtube.com/vi/Q_cdFh9fhxY/mqdefault.jpg", width 128 ] [] ]
                        , div []
                            [ a [ href "https://www.youtube.com/watch?v=Q_cdFh9fhxY", target "_blank" ]
                                [ b [] [ text "Immutable Data with FunctionalJ.io" ] ]
                            , p [] [ text "Immutability is an important principle of functional programming. Mutable objects hide changes. And hidden changes can lead to unpredictability and chaos." ]
                            ]
                        ]
                    ]
                , li []
                    [ p []
                        [ a [ href "https://www.youtube.com/watch?v=JWKl2cfkVrw", target "_blank" ]
                            [ img [ src "https://img.youtube.com/vi/JWKl2cfkVrw/mqdefault.jpg", width 128 ] [] ]
                        , div []
                            [ a [ href "https://www.youtube.com/watch?v=JWKl2cfkVrw", target "_blank" ]
                                [ b [] [ text "Choice Types in Java with FunctionalJ.io" ] ]
                            , p [] [ text "Choice types allow the specification of possible values in an ad-hoc fasion." ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
