module Features.PipeablePipeLine exposing (description, examplePipe, examplePipeLine, featPipeablePipeLine, title)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featPipeablePipeLine =
    Feature title
        description
        [ examplePipe
        , examplePipeLine
        , examplePipeableClass
        ]


title =
    "Pipeable and PipeLine"


description =
    """
        Pipeable makes any data pipeable through a function flow.
        PipeLine lets functions be composed together to be used as one function.
      """


examplePipe =
    Example "Pipe object through functions"
        [ p [] [ text "Pipe any object thought functions" ]
        , codeShow """
import static functionalj.functions.StrFuncs.replaceAll;

...
      val str = Pipeable.of("Hello world.").pipe(
                  String::toUpperCase,
                  replaceAll("\\\\.", "!!")
            );
      assertEquals("HELLO WORLD!!", str);
"""
        ]


examplePipeLine =
    Example "PipeLine can be created in advance"
        [ p [] [ text "PipeLine can be created in advance from functions. This allow point-free style of coding." ]
        , codeShow """
val readFile = PipeLine
        .of  (String.class)
        .then(Paths ::get)
        .then(Files ::readAllBytes)
        .then(String::new)
        .thenReturn();
    
val fileNames = FuncList.of("file1.txt", "file2.txt");
val fileContents = fileNames.map(readFile);
// Notice that the error is suppressed.
assertEquals("[null, null]", fileContents.toString());
"""
        ]


examplePipeableClass =
    Example "Pipeable interface"
        [ p [] [ text "Pipeable is an interface. Any class that implements it can pipe." ]
        , codeShow """
public class User implements Pipeable<User> {
    private String name;
    public User(String name) { this.name = name; }
    public String name() { return name; }
    @Override
    public User __data() throws Exception { return this; }
}

...
val user = new User("root");
assertEquals("User name: root", user.pipe(User::name, "User name: "::concat));
"""
        ]
