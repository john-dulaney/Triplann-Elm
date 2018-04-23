module CoinsToCash exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Json.Decode exposing (..)
import Json.Map exposing (..)

-- Once you have given yourself a large stash of coins in your piggybank, look at each key and perform the appropriate math on the integer value to determine how much money you have in dollars. Store that value in a variable named dollarAmount.


main = 
    Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

type alias Model =
    { pennies : Int
    , nickels : Int
    , dimes : Int
    , quarters : Int
    , dollars : Int
    }

model : Model
model = 
    Model 0 0 0 0 0

type Msg
    = Pennies Int
    | Nickels Int
    | Dimes Int
    | Quarters Int
    | Dollars Int

update : Msg -> Model -> Model
update msg model =
    case msg of
        Pennies pennies ->
            { model | pennies = pennies }

        Nickels nickels ->
            { model | nickels = nickels }

        Dimes dimes ->
            { model | dimes = dimes }

        Quarters quarters ->
            { model | quarters = quarters }

        Dollars dollars ->
            { model | dollars = dollars }

view : Model -> Html Msg
view model =
    div [id "Coin_Form"] 
        [ input [ type_ "Number", placeholder "Pennies", onInput Pennies ] []
        , input [ type_ "Number", placeholder "Nickels", onInput Nickels ] []
        , input [ type_ "Number", placeholder "Dimes", onInput Dimes ] []
        , input [ type_ "Number", placeholder "Quarters", onInput Quarters ] []
        -- , button [ type_ "Submit", placeholder "Quarters", onInput Quarters ] []
        ]

onIntInput : (Int -> msg) -> Attribute msg
onIntInput tagger =
  Html.Events.on "input" (Json.map tagger (Json.at ["target", "value"] Json.int))

notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
