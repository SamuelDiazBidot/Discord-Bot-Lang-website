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
    , scrollbarY
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
    [ column 
        contentAttributes  
        [ section "Basic program structure"
        , paragraph 
            [ Font.color white, paddingXY 60 10 ]
            [ Element.text  
                """
                A functional program is coposed of 2 parts, a token and a command. Only one token is needed to write a functional program. 
                The token must be a valid. To obtain a valid token refer to the dicord developer portal. 
                At least one comman is needed, but you can use as many commands as you like.
                A program also can be composed of variables and functions but these are optional.
                """ 
            ]
        , column
            codeBlockAttributes
            [ codeLine [purple, white, green, white] ["token", "(", "'NzAxODA3MzU4NjYxMDk5NTgy.XrMWEA.D10sg4j1LjIhLJycz_rzaZVqr-4'", ")"]
            , codeLine [white] [""]
            , codeLine [purple, white] ["command ", "myCommand() {"]
            , codeLine [white] ["}"]
            ]
        , section "Variables and simple data structures"
        , paragraph 
            [ Font.color white, paddingXY 60 10 ]
            [Element.text 
                """
                Variables can be declared by binding an id to its value using the '=' sign.
                Discord bot lang has support for the following types: Integer, Float, Boolean ans String.
                Discord bot also supports basic data structures such as lists and hashmaps.  
                """
            ]
        , column
            codeBlockAttributes
            [ codeLine [white, green] ["x = ", "4"]
            , codeLine [white, green] ["y = ", "true"]
            , codeLine [white, green] ["list = ", "[1,2,4]"]
            , codeLine [white, green] ["map = ", "{'a' : 1, 'b' : 2}"]
            ]
        , section "flow expressions"
        , paragraph
            [ Font.color white, paddingXY 60 10 ]
            [ Element.text
                """
                Discord bot lang supports the following flow expressions: If..else, try..except and for..in loops.
                """
            ]
        , column 
            codeBlockAttributes
            [ codeLine [pink, white] ["if ", "x > 10 {"]
            , codeLine [yellow] ["\t~ Body"]
            , codeLine [white, pink, white] ["} ", "else ", "{"]
            , codeLine [yellow] ["\t~ Body"]
            , codeLine [white] ["}"]
            , codeLine [white] [""]
            , codeLine [pink, white] ["try ", "{"]
            , codeLine [yellow] ["\t~ Body"]
            , codeLine [white, pink, white] ["} ", "except ", "{"]
            , codeLine [yellow] ["\t~ Body"]
            , codeLine [white] ["}"]
            , codeLine [white] [""]
            , codeLine [pink, white, pink, white] ["for ", "x ", "in ", "0..10 {"]
            , codeLine [yellow] ["\t~ Body"]
            , codeLine [white] ["}"]
            ]
        , section "Functions and function calls"
        , paragraph
            [ Font.color white, paddingXY 60 10 ]
            [ Element.text 
                """
                Functions and commands are very similar. Both can have variables, function calls, and flow expressions. Discord bot lang has support for recursive function calls. 
                Only functions can be called in a program, commands cannot be called. To declare a function simply use the 'fn' keyword. 
                Discord bot lang can call functions from python's core library by adding a dot in front of a function call.
                Discord bot lang has some pre-declared functions such as token and send.
                In the following example we declare a function called sum, that returns the sum of two integers.
                """
            ]
        , column
            codeBlockAttributes
            [ codeLine [purple, white] ["fn ", "myFunction(x,y) {"]
            , codeLine [pink, white] ["\ttry", "{"]
            , codeLine [white, purple, white] ["\t\tx = ", ".int", "(x)"]
            , codeLine [white, purple, white] ["\t\ty = ", ".int", "(y)"]
            , codeLine [white] ["\t\tresult = x + y"]
            , codeLine [pink, white] ["\t\treturn ", "result"]
            , codeLine [white, pink, white] ["\t} ", "except", "{"]
            , codeLine [purple, white, green, white] ["\t\t.print", "(","'An Error occured'", ")"]
            , codeLine [white] ["\t}"]
            , codeLine [white] ["}"]
            ]
        ]    
    ]

