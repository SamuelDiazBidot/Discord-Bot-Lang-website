module Main exposing (..)
import Content exposing (..)
import Pallete exposing (..)
import Browser
import Html exposing (Html)
import Element exposing (..)
import Element.Input exposing (..)
import Element.Events exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font

content : List String
content = 
    [ "Home"
    , "About"
    , "Examples"
    , "Contact"
    ]
    
header : Element msg
header =
    row [ width fill
        , paddingXY 10 10
        ]
        [ image 
            [ width <| px 400
            , height <| px 136
            , centerX
            ]
            { src = "./logo.png", description = "logo"}
        , link
            []
            { url = "https://github.com/SamuelDiazBidot/Discord-Bot-Lang"
            , label = 
                image
                    [ width <| px 50 
                    , height <| px 50
                    , alignRight
                    ]
                    {src = "./github-logo.png", description = "github repo link"}
            }
        ]
        
body : Page -> Element Msg
body page =
    row [ width fill 
        , height fill
        , padding 10
        , spacing 10
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
            [ Background.color blue, Font.bold]

        contentListAttrs msg =
            [ width fill, height <| px 30, paddingXY 10 5, onClick msg, Font.color white, Border.rounded 2, mouseOver [ Background.color grey ]]

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
            , scrollbarY 
            ]
        <| List.map (\x -> contentEl x (ChangeContent <| stringToPage x)) contentList
        
contentPanel : Page -> Element msg
contentPanel page =
    let 
        pageContent =
            case page of
                Home ->
                    homeContent
                About ->
                    aboutContent
                Examples ->
                    examplesContent
                Contact ->
                    contactContent
    in
        column 
            [ height fill
            , width <| fillPortion 3
            , scrollbarY
            , padding 10
            , spacing 10
            , Background.color darkGrey
            , Border.rounded 10
            ]
            pageContent
        
type Page
    = Home
    | About
    | Examples
    | Contact
    
pageToString : Page -> String
pageToString page =
    case page of
        Home ->
            "Home"
        About ->
            "About"
        Examples ->
            "Examples"
        Contact ->
            "Contact"

stringToPage : String -> Page
stringToPage string =
    case string of
        "Home" ->
            Home
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
               , Background.image "./discordBackground.png"
               ]
            [ header
            , body model.currentPage
            , footer
            ]