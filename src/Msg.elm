module Msg exposing (Msg(..))

import Html


-- Add as required by elm build 
main =
  Html.text "Hello!"


type Msg
    = SelectFeature Int
    | SelectExample Int
    | ChooseGradle
    | ChooseMaven
