module Content exposing (..)
import Pallete exposing (..)
import Element exposing (..)
import Element.Font as Font
import Element.Border as Border
import Element.Background as Background

contentAttributes =
    [ width fill 
    , height fill
    , paddingXY 0 10
    ] 

aboutContent = 
    [ el 
        [Font.color white, centerX ] 
        <| Element.text "Discord Bot lang is a dynamically typed language that facilitates the creation of discord bots." 
    , textColumn 
        contentAttributes
        [ 
        paragraph 
            [ Font.color white ]
            [ Element.text  
                """
                The purpose of the Discord Bot lang is to allow a direct connection to the discord API which in turn facilitates the creation and deployment of simple discord bots.
                The language allows for the implementation of commands for the bot to follow.
                """ ]
        ]
    ]
examplesContent = 
    [ textColumn 
        contentAttributes
        [ paragraph 
            [ Font.color white ]
            [ Element.text  """sdd""" ]
        ]    
    ]
contactContent = 
    [ textColumn 
        contentAttributes
        [ paragraph 
            [ Font.color white ]
            [ Element.text  """sdd""" ]
        ]
    ]
