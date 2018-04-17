-- Module Declaration
module Main exposing (..)
-- Imports 
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
-- Main declaration, outlines the main as including a model, a view, and an update method
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }

-- MODEL - types each piece to the proper type. Strings galore
type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }
-- I think lower case model is reserved somehow, anyway set it to accept what uper Case Model is, and set the string values to empty
model : Model
model =
    Model "" "" ""

-- UPDATE - I dont get this
type Msg
    = Name String
    | Password String
    | PasswordAgain String

-- Update is maybe a reserved word for two way data binding?
update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain password ->
            { model | passwordAgain = password }

-- VIEW
view : Model -> Html Msg
view model =
    div [id "form"]
        [ input [ type_ "text", placeholder "Name", onInput Name ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
        , viewValidation model
        ]

viewValidation : Model -> Html msg
viewValidation model =
    let
        ( color, message ) =
            if model.password == model.passwordAgain then
                ( "green", "OK" )
            else
                ( "red", "Passwords do not match!" )
    in
        div [ style [ ( "color", color ) ] ] [ text message ]