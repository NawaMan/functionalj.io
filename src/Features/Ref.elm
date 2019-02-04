module Features.Ref exposing (featRef)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featRef =
    Feature title
        description
        [ exampleDependencyInjection ]


title =
    "Ref - Dependency Injection"


description =
    """
        Ref (reference) enables instance-base context and dependency injection as oppose to class/annotation-base one.
        This is very suitable to functional programming.
      """


exampleDependencyInjection =
    Example "DependencyInjection"
        [ p [] [ text "Ref can be used for dependency injection that works with functions." ]
        , codeShow """
import static functionalj.ref.Run.With;

...
// Define injection points and the default.
static Ref<Function<String, String>> greeting = Ref.ofValue(RefExamples::defaultGreeting);
static Ref<Consumer<String>>         println  = Ref.ofValue(System.out ::println);

private static String defaultGreeting(String name) {
    return String.format("Hello %s!!", name);
}

public static void greet(String name) {
    // Get the injected value and use it.
    val greeting = greeting.value().apply(name);
    println.value().accept(greeting);
}

public static void main(String[] args) {
    // Using it in Production
    greet("Jack");
}

@Test
public void testDefaultMessage() {
    val logs = new ArrayList<String>();
    // Override the injected value.
    With(println.butWith(logs::add))
    .run(()-> {
        // Use it with the overried values.
        greet("Jack");
    });
    assertEquals("[Hello Jack!!]", logs.toString());
}

@Test
public void testCustomMessage() {
    val logs = new ArrayList<String>();
    // Override the injected value.
    With(println .butWith(logs::add),
         greeting.butWith(name -> "What's up " + name + "?"))
    .run(()-> {
        // Use it with the overried values.
        greet("Jack");
    });
    assertEquals("[What's up Jack?]", logs.toString());
}
"""
        ]
