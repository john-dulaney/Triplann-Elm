-- module Main exposing (..)

-- import Html exposing (..)
-- import Html.Attributes exposing (..)
-- import Html.Events exposing (onInput, onSubmit)
-- import Json.Decode exposing (..)

-- -- Once you have given yourself a large stash of coins in your piggybank, look at each key and perform the appropriate math on the integer value to determine how much money you have in dollars. Store that value in a variable named dollarAmount.

-- main : Program Never Model Msg
-- main = 
--     Html.beginnerProgram
--     { model = model
--     , view = view
--     , update = update
--     }

-- type alias Model =
--     { pennies : Float
--     , nickels : Float
--     , dimes : Float
--     , quarters : Float
--     , dollars : Float
--     }

-- model : Model
-- model = 
--     Model 0.0 0.0 0.0 0.0 0.0

-- type Msg
--     = Pennies Float
--     | Nickels Float
--     | Dimes Float
--     | Quarters Float
--     | Dollars Float

-- update : Msg -> Model -> Model
-- update msg model =
--     case msg of
--         Pennies pennies ->
--             { model | pennies = pennies * 0.01 }

--         Nickels nickels ->
--             { model | nickels = nickels * 0.05 }

--         Dimes dimes ->
--             { model | dimes = dimes * 0.10 }

--         Quarters quarters ->
--             { model | quarters = quarters * 0.25 }

--         Dollars dollars ->
--             { model | dollars = dollars }

-- view : Model -> Html Msg
-- view model =
--     -- div [id "form"] 
--     --     [ h4 [] [ text "Coins to cash" ]
--     --     , input [ type_ "Number", placeholder "Pennies" ] []
--     --     , input [ type_ "Number", placeholder "Nickels" ] []
--     --     , input [ type_ "Number", placeholder "Dimes" ] []
--     --     , input [ type_ "Number", placeholder "Quarters" ] []
--     --     , button [ type_ "Submit", placeholder "Do it" ] [text "Click it fam"]
--     --     , cashUpdate model
--     --     ]
--     div [id "Coin_Form"] 
--         [ input [ type_ "Number", placeholder "Pennies", onInput Pennies ] []
--         , input [ type_ "Number", placeholder "Nickels", onInput Nickels ] []
--         , input [ type_ "Number", placeholder "Dimes", onInput Dimes ] []
--         , input [ type_ "Number", placeholder "Quarters", onInput Quarters ] []
--         , button [ type_ "Submit", placeholder "Do it" ] []
--         ]

-- onIntInput : (Int -> msg) -> Attribute msg
-- onIntInput tagger =
--   Html.Events.on "input" (Json.Decode.map tagger (at ["target", "value"] int))




-- cashUpdate : Model -> Html msg
-- cashUpdate model =
--     let
--         ( color, message ) =
--             if model.pennies == 0.01 then
--                 ( "green", "OK" )
--             else
--                 ( "red", "Something Aint Right" )
--     in
--         div [ style [ ( "color", color ) ] ] [ text message ]