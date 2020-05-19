module Main exposing (..)
import Browser
import Html exposing (Html)
import Element exposing (..)
import Element.Input exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font

white : Color
white =
    rgb255 0xff 0xff 0xff
    
grey : Color
grey =
    rgb255 0xd0 0xd0 0xd0

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
        [ el [centerX] (Element.text "Discord bot lang") ]
        
body : Page -> Element Msg
body page =
    row [ width fill 
        , height fill
        ]
        [ contentListPanel content "About"
        , contentPanel page
        ]
        
footer : Element msg
footer =
    row [ width fill
        , paddingXY 0 10
        ]
        [ el [centerX]
             (Element.text "TODO")
        ]
        
myButton : String -> Msg -> Element Msg
myButton routeName msg =
    button
        [ Background.color grey
        , width fill
        , paddingXY 5 2
        --, height fill
        ]
        { onPress = Just msg
        , label = Element.text routeName
        }

contentListPanel : List String -> String -> Element Msg
contentListPanel contentList activeContent =
    let
        activeContentAttrs =
            [ Background.color <| rgba255 0 0 0 0.4, Font.bold ]

        contentListAttrs =
            [ width fill, height <| px 30, paddingXY 10 5 ]

        contentEl content1 =
            el
                (if content1 == activeContent then
                    activeContentAttrs ++ contentListAttrs

                 else
                    contentListAttrs
                )
            <|
                Element.text content1
    in
        column
            [ height fill 
            , width (fill |> maximum 200)
            , paddingXY 0 10 
            , scrollbarY 
            , Background.color <| rgb255 0xd0 0xd0 0xd0
            --, Font.color white
            ]
        <|
        List.map (\x -> (myButton x) <| ChangeContent <| (stringToPage x) ) contentList
        --List.map contentEl contentList
        
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
                ] 
                [ paragraph []
                    [ Element.text pageContent ]
                ]
            ]
        
type Page
    = About
    | Examples
    | Contact
    
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
  { currentPage = About }
  
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
               ]
            [ header
            , body model.currentPage
            , footer
            ]
    
