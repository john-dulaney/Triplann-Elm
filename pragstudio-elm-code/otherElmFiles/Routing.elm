-- module Routing exposing (..)

-- import Navigation exposing (Location)
-- import Models exposing (TriplannId, Route(..))
-- import UrlParser exposing (..)


-- matchers : Parser (Route -> a) a
-- matchers =
--     oneOf
--         [ map TriplannsRoute top
--         , map TriplannRoute (s "triplann" </> string)
--         , map TriplannsRoute (s "triplann")
--         ]


-- parseLocation : Location -> Route
-- parseLocation location =
--     case (parseHash matchers location) of
--         Just route ->
--             route

--         Nothing ->
--             NotFoundRoute


-- triplannsPath : String
-- triplannsPath =
--     "#triplann"


-- triplannPath : TriplannId -> String
-- triplannPath id =
--     "#triplanns/" ++ id
