port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import DataTables exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


-- TYPES

type alias Model =
    { selectedRowIndex : Maybe Int
    }

type Msg
    = Select Int


-- MODEL

columns : List String
columns =
    [ "Rank"
    , "City"
    , "Population"
    ]

contents : List DataTableRecord
contents =
    [ ( 1, "Tokyo", 33200000 )
    , ( 2, "New York", 17800000 )
    , ( 3, "Sao Paulo", 17700000 )
    ]

init : ( Model, Cmd Msg )
init =
    ( { selectedRowIndex = Nothing }, initDataTables (DataTableConfig columns contents) )


----- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Select index ->
            ( { model | selectedRowIndex = Just index }, Cmd.none )


-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ datatable []
        , div [] [ text ("Selected index: " ++ (toString model.selectedRowIndex)) ]
        ]


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    toElm Select