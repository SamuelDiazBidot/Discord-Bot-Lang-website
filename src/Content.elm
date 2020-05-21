module Content exposing (..)
import Html exposing (ul, li, text)
import Pallete exposing (..)
import Element exposing (..)
import Element.Font as Font
import Element.Background as Background

section : String -> Element msg 
section name =
    paragraph
        [Font.color blue, Font.size 30, alignTop ]
        [ Element.text <| "#" ++ name ++ ":"] 

contentAttributes : List (Attribute msg)
contentAttributes =
    [ width fill 
    , paddingXY 0 10
    ] 

ulElement : List (Attribute msg) -> List String -> Element msg
ulElement attributes elements =
    let
        liHtml =
            List.map (\x -> li [] [ Html.text x ]) elements
    in
        el attributes
            <| html <| ul [] liHtml 

codeLine : List Color -> List String -> Element msg
codeLine colors strings =
    let
        tuples =
            List.map2 Tuple.pair colors strings
        
        wordElements =
            List.map (\(x, y) -> el [ Font.color x ] <| Element.text y) tuples
    in
        row [] wordElements
    
        


homeContent : List (Element msg)
homeContent = 
    [ textColumn 
        contentAttributes
        [ paragraph 
            [ Font.color white ]
            [ Element.text  """sdd""" ]
        ]    
    ]

aboutContent : List (Element msg)
aboutContent = 
    [ el 
        [Font.color white, Font.size 30, Font.heavy, centerX ] 
        <| Element.text "Discord Bot lang is a dynamically typed language that facilitates the creation of discord bots." 
    , column 
        contentAttributes
        [ section "Purpose"
        , paragraph 
            [ Font.color white, paddingXY 60 0]
            [ Element.text  
                """
                Discord Bot lang allows a direct connection to the discord API which in turn facilitates the creation and deployment of simple discord bots.
                The language allows for the implementation of commands for the bot to follow.
                """ 
            ]
        , section "Features"
        , ulElement [ Font.color white, paddingXY 40 0 ] ["Closure support", "Python3 core library", "Easy discord bot prototyping", "Auto-generated command error handling"]
        ]
    ]

examplesContent : List (Element msg)
examplesContent = 
    [ column
        contentAttributes
        [ section "Echo command bot" 
        , column [ paddingXY 60 10 ]
            [ codeLine [purple, white, green, white] ["token", "(", "'NzAxODA3MzU4NjYxMDk5NTgy.XrMWEA.D10sg4j1LjIhLJycz_rzaZVqr-4'", ")"]
            , codeLine [white] [""]
            , codeLine [blue, white] ["command ", "echo(arg) {"]
            , codeLine [purple, white] ["\tsend", "(arg)"]
            , codeLine [white] ["}"]
            ] 
        , section "Counter bot"
        , column [ paddingXY 60 10 ]
            [ codeLine [purple, white, green, white] ["token", "(", "'NzAxODA3MzU4NjYxMDk5NTgy.XrMWEA.D10sg4j1LjIhLJycz_rzaZVqr-4'", ")"]
            , codeLine [white] [""]
            , codeLine [white, green] ["counter = ", "0"]
            , codeLine [white] [""]
            , codeLine [purple, white] ["command", "increment() {"]
            , codeLine [pink, white] ["\tglobal ", "counter"]
            , codeLine [white, green] ["\tcounter = counter + ", "1"]
            , codeLine [white] ["}"]
            , codeLine [white] [""]
            , codeLine [purple, white] ["command", "decrement() {"]
            , codeLine [pink, white] ["\tglobal ", "counter"]
            , codeLine [white, green] ["\tcounter = counter - ", "1"]
            , codeLine [white] ["}"]
            , codeLine [white] [""]
            , codeLine [purple, white] ["command", "show() {"]
            , codeLine [pink, white] ["\tglobal ", "counter"]
            , codeLine [purple, white] ["\tsend", "(counter)"]
            , codeLine [white] ["}"]
            ]
        ]
    ]

contactContent : List (Element msg)
contactContent = 
    [ textColumn 
        contentAttributes
        [ paragraph 
            [ Font.color white ]
            [ Element.text  """sdd""" ]
        ]
    ]
