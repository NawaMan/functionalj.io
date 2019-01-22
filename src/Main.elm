module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int
    }


initialModel : Model
initialModel =
    { count = 1
    }


type Msg
    = Increment
    | Decrement
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model
                | count =
                    if model.count <= 0 then
                        0

                    else
                        model.count - 1
            }

        Reset ->
            { model | count = 0 }


view : Model -> Html Msg
view model =
    div [] []
        -- [ button [ onClick Increment ] [ text "Increse" ]
        -- , div []
        --     [ text <| String.fromInt model.count
        --     , button [ onClick Reset ] [ text "Reset to zero" ]
        --     ]
        -- , button [ onClick Decrement ] [ text "Decrese" ]
        -- ]

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
