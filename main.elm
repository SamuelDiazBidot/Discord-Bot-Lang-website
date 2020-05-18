module Main exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font

white : Color
white =
    rgb255 0xff 0xff 0xff

content : List String
content = 
    [ "About"
    , "Examples"
    , "Contact"
    ]

header : Element msg
header =
    row [ width fill
        , paddingXY 0 10
        ]
        [ el [centerX] (text "Discord bot lang") ]
        
body : Element msg
body =
    row [ width fill 
        , height fill
        ]
        [ contentListPanel content "About"
        , contentPanel 
        ]
        
footer : Element msg
footer =
    row [ width fill
        , paddingXY 0 10
        ]
        [ el [centerX]
             (text "TODO")
        ]
        
contentListPanel : List String -> String -> Element msg
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
                text content1
    in
    column
        [ height fill 
        , width (fill |> maximum 200)
        , paddingXY 0 10 
        , scrollbarY 
        --, Background.color <| rgb255 0xd0 0xd0 0xd0
        --, Font.color white
        ]
    <|
        List.map contentEl contentList
        
contentPanel : Element msg
contentPanel =
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
                [text """Lorem ipsum dolor sit amet, justo id nam fermentum mauris amet, per leo ac tempor tortor repellat quisque, dapibus gravida dapibus et fames, sollicitudin donec. Leo odio ullamcorper velit quis. Dolor hendrerit fusce ipsum lacus. Mus amet est eveniet vitae, pharetra in vulputate et convallis. Blandit ornare eleifend auctor elementum est orci, tellus sapien ante placerat, ut quam dictum. Nostra justo elit urna nisl purus morbi, enim dolor, mauris cras nonummy id odio dolor, etiam donec aliquam dolor. Nunc sit consectetuer, id non nam feugiat at vel, dis mattis aliquam ante, eu nibh ac odio hymenaeos euismod arcu, lobortis aliquet. Vestibulum ut dui nibh ornare ridiculus neque, nisl wisi quam, adipiscing pellentesque. Tincidunt consequat magna, quam vitae per, ut massa ultrices class proin. Ut nisl consectetuer, morbi lectus, morbi commodo etiam maecenas nunc placerat massa, in suspendisse sed eget sed commodo pulvinar. Sed cursus tempus, magnis dui eu cursus justo tincidunt. Semper at urna fermentum, mauris sagittis tincidunt, elit aliquam, ac faucibus donec consectetuer quis sed orci."""]
            ]
        ]

main = 
    layout [] <|
        column [ width fill
               , height fill
               ]
            [ header
            , body
            , footer
            ]
