module View exposing (..)

import Html exposing (Html, div, text)
import Models exposing (Model, TriplannId)
import Models exposing (Model)
import Msgs exposing (Msg)
import RemoteData


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.TriplannsRoute ->
            Triplanns.List.view model.triplanns

        Models.TriplannRoute id ->
            triplannEditPage model id

        Models.NotFoundRoute ->
            notFoundView


triplannEditPage : Model -> TriplannId -> Html Msg
triplannEditPage model triplannId =
    case model.triplanns of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success triplanns ->
            let
                maybeTriplann =
                    triplanns
                        |> List.filter (\triplann -> triplann.id == triplannId)
                        |> List.head
            in
                case maybeTriplann of
                    Just triplann ->
                        Triplanns.Edit.view triplann

                    Nothing ->
                        notFoundView

        RemoteData.Failure err ->
            text (toString err)


