port module DataTables exposing (..)

import Html exposing (Html, Attribute, table)
import Html.Attributes exposing (id)

type alias DataTableRecord = (Int, String, Int)

type alias DataTableConfig =
    { columns : List String
    , data : List DataTableRecord
    }

port initDataTables : DataTableConfig -> Cmd msg

port toElm : (Int -> msg) -> Sub msg

datatable : List (Attribute a) -> Html a
datatable attr =
    table (attr ++ [id "dt-table"]) []
