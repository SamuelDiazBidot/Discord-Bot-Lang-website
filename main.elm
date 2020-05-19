module Main exposing (..)
import Browser
import Html exposing (Html)
import Element exposing (..)
import Element.Input exposing (..)
import Element.Events exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font

blue : Color
blue =
    rgb255 0x72 0x89 0xda

white : Color
white =
    rgb255 0xff 0xff 0xff
    
grey : Color
grey =
    rgb255 0x99 0xaa 0xb5
    
darkGrey : Color
darkGrey =
    rgb255 0x2c 0x2f 0x33
    
darkerGrey  : Color
darkerGrey =
    rgb255 0x23 0x27 0x2a
    

content : List String
content = 
    [ "About"
    , "Examples"
    , "Contact"
    ]
    
aboutContent = """
About info here!
"""

examplesContent = """
Examples here 
"""

contactContent = """
contact info here
"""
    

header : Element msg
header =
    row [ width fill
        , paddingXY 0 10
        ]
        [ el [ centerX
             , Font.size 52
             , Font.color white
             , Font.family
                 [ Font.typeface "Calibri"
                 , Font.monospace
                 ]
             ] 
             (Element.text "Discord bot lang") ]
        
body : Page -> Element Msg
body page =
    row [ width fill 
        , height fill
        ]
        [ contentListPanel content (pageToString page)
        , contentPanel page
        ]
        
footer : Element msg
footer =
    row [ width fill
        , paddingXY 0 10
        ]
        [ el 
            [ centerX
            , Font.color white
            , Font.size 12
            ]
             (Element.text "Not affiliated with Discord Inc.")
        ]
        
contentListPanel : List String -> String -> Element Msg
contentListPanel contentList activeContent =
    let
        activeContentAttrs =
            [ Background.color blue, Font.bold, Border.rounded 2]

        contentListAttrs msg =
            [ width fill, height <| px 30, paddingXY 10 5, onClick msg, Font.color white]

        contentEl content1 msg =
            el
                (if content1 == activeContent then
                    activeContentAttrs ++ contentListAttrs msg

                 else
                    contentListAttrs msg
                )
            <|
                Element.text content1
    in
        column
            [ height fill 
            , width (fill |> maximum 200)
            , paddingXY 0 10 
            , Background.color darkerGrey
            , scrollbarY 
            ]
        <| List.map (\x -> contentEl x (ChangeContent <| stringToPage x)) contentList
        
contentPanel : Page -> Element msg
contentPanel page =
    let 
        pageContent =
            case page of
                About ->
                    aboutContent
                Examples ->
                    examplesContent
                Contact ->
                    contactContent
    in
        row [ width fill
            , height fill
            , width <| fillPortion 3
            , scrollbarY
            , paddingXY 10 10
            ]
            [ textColumn 
                [ width fill 
                , height fill
                , paddingXY 10 10
                , Background.color darkGrey
                , Border.rounded 2
                ] 
                [ paragraph 
                    [ Font.color white
                    ]
                    [ Element.text pageContent ]
                ]
            ]
        
type Page
    = About
    | Examples
    | Contact
    
pageToString : Page -> String
pageToString page =
    case page of
        About ->
            "About"
        Examples ->
            "Examples"
        Contact ->
            "Contact"

stringToPage : String -> Page
stringToPage string =
    case string of
        "About" ->
            About
        "Examples" ->
            Examples
        "Contact" ->
            Contact
        _ ->
            About
        
type alias Model = 
    { currentPage : Page 
    }

init : Model
init =
  { currentPage = Examples }
  
type Msg
    = ChangeContent Page
  
update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeContent page ->
        { model | currentPage = page }

main =
  Browser.sandbox
    { init = init
    , update = update
    , view = view
    }
 
view :  Model -> Html Msg
view model = 
    layout [] <|
        column [ width fill
               , height fill
               , Background.color darkerGrey
               ]
            [ header
            , body model.currentPage
            , footer
            ]
    
