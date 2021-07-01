module CodeBlock exposing (codeBlock)

import Html exposing (Html, a, button, code, div, h1, p, pre, span, text)
import Html.Attributes exposing (class, href, id, name)
import SyntaxHighlight exposing (javascript, monokai, toBlockHtml, useTheme)


main =
  Html.text "Hello!"


codeBlock : String -> Html msg
codeBlock codeText =
    div []
        [ useTheme monokai
        , javascript codeText
            |> Result.map (toBlockHtml (Just 1))
            |> Result.withDefault
                (pre [ class "elmsh" ]
                    [ code [ class "elmsh" ] [ text (String.trim codeText) ]                    ]
                )
        ]
