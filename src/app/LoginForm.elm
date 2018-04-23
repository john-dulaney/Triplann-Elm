-- Module Declaration
module Form exposing (..)
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
-- read up on this
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain password ->
            { model | passwordAgain = password }

-- VIEW - View must be reserved, accepts the msg model for use on the inputs
view : Model -> Html Msg
view model =
-- Construct the html elements that make the form. Apparenty you declare the type of element, then stilck the html attributes in the []
    div [id "form"]
        [ input [ type_ "text", placeholder "Name", onInput Name ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
        -- this gets froggy right here
        , viewValidation model
        ]
-- this model sets up the logic for matching the passwords and displaying the green or red html elements.
viewValidation : Model -> Html msg
viewValidation model =
    let
    -- I dont get this structure
        ( color, message ) =
        -- easy if, then, else
        -- the () is a color, then the text. It is set belowthe logic
            if model.password == model.passwordAgain then
                ( "green", "OK" )
            else
                ( "red", "Passwords do not match!" )
        -- this is where the logic above's set values are passed into the created style element. Accepts color and text.
    in
        div [ style [ ( "color", color ) ] ] [ text message ]