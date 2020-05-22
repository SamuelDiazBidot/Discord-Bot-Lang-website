module Content exposing (..)
import Html exposing (ul, li, text)
import Pallete exposing (..)
import Element exposing (..)
import Element.Font as Font
import Element.Background as Background
import Element.Border as Border

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

codeBlockAttributes : List (Attribute msg)
codeBlockAttributes =
    [ paddingXY 60 10 
    , Background.color darkerGrey
    , Border.rounded 10
    , centerX
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

contactInfo : String -> String -> String -> String -> Element msg
contactInfo imgLocation imgDescription name email =
    column
        [ centerX
        , centerY
        , spacing 20
        ]
        [ image 
            [ Border.rounded 200
            , centerX
            , centerY
            , clip 
            ]
            { src = imgLocation, description = imgDescription }
        , column 
            [ centerX ]
            [ el 
                [ Font.color white
                , Font.heavy
                , centerX
                ]
                <| Element.text name
            , el 
                [ Font.color white 
                , Font.heavy
                , centerX
                ]
                <| Element.text email
            ]
        ]

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
            [ Font.color white, paddingXY 60 10]
            [ Element.text  
                """
                Discord Bot lang allows a direct connection to the discord API which in turn facilitates the creation and deployment of simple discord bots.
                The language allows for the implementation of commands for the bot to follow.
                """ 
            ]
        , section "Features"
        , ulElement [ Font.color white, paddingXY 40 0 ] ["Closure support", "Python3 core library", "Easy discord bot prototyping", "Auto-generated command error handling"]
        , section "How it works"
        , paragraph
            [ Font.color white, paddingXY 60 10]
            [ Element.text 
                """
                Discord bot lang's interpreter takes an input file and procceses its contents to generate intermidiate code.
                The lexer divides the contents of the input file into tokens. Tokens are categorized as keywords such as 'if' and 'else', types such as 'Integers' and symbols such as '+'.
                The tokens are then grouped tougether to fit the grammar rules. The end result of parsing the tokens is a asbstract syntax tree, AST for short.
                Using the generated AST the interpreter can generate python code. 
                Finaly the interpreter runs the generated python code using Discord.py, a library that wraps the discod api.
                The following flow diagram show the proccess.
                """
            ]
        , image 
            [ paddingXY 60 10] 
            { src = "./Diagram.png", description = "Diagram"}
        ]
    ]

examplesContent : List (Element msg)
examplesContent = 
    [ column
        contentAttributes
        [ section "Echo command bot" 
        , el 
            [ Font.color white, paddingXY 60 10 ] 
            <| Element.text "The following code is a bot that echoes its input back to the user. Once the bot is running by typing '-echo hello' the bot responds by returning 'hello'."
        , column 
            codeBlockAttributes
            [ codeLine [purple, white, green, white] ["token", "(", "'NzAxODA3MzU4NjYxMDk5NTgy.XrMWEA.D10sg4j1LjIhLJycz_rzaZVqr-4'", ")"]
            , codeLine [white] [""]
            , codeLine [blue, white] ["command ", "echo(arg) {"]
            , codeLine [purple, white] ["\tsend", "(arg)"]
            , codeLine [white] ["}"]
            ] 
        , section "Counter bot"
        , paragraph 
            [ Font.color white, paddingXY 60 10 ]
            [ Element.text 
                """
                The following code is a bot that acts like a counter. 
                It has tree commands, one increments the counter, another one decrements it and the last one show the counter amount.
                """ 
            ]
        , column 
            codeBlockAttributes
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
    [ row
        (contentAttributes ++ [spacing 150, centerY])
        [ contactInfo "./portrait1.jpg" "portrait1" "Samuel Diaz" "samuel.diaz9@upr.edu"
        , contactInfo "./portrait2.jpeg" "portrait2" "Brandon Cobo" "brandon.cobo@upr.edu"
        ]

    ]

tutorialContent : List (Element msg)
tutorialContent = 
    [ textColumn 
        contentAttributes
        [ paragraph 
            [ Font.color white ]
            [ Element.text  """sdd""" ]
        ]    
    ]

