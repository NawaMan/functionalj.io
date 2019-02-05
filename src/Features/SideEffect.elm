module Features.SideEffect exposing (featSideEffect)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featSideEffect =
    Feature title
        description
        [ deferActionPromiseExample
        , taskExample
        , taskStore
        ]


title =
    "Side Effect"


description =
    """
      DeferAction, Promise and Task help manage side effects in functional-style way.
      Store helps collecting changes to an immutable object.
      """


deferActionPromiseExample =
    Example "DeferAction and Promise"
        [ p []
            [ text "DeferAction and Promise allows separation of creation and configure of side-effect and using it."
            , text "This allows the business logic to decouple from the the side-effect code."
            ]
        , codeShow """
val logs = new ArrayList<String>();

// The preparation
val loadFile = f((String fileName) -> {
    return DeferAction
        .from(()->Files.readAllBytes(Paths.get(fileName)))
        .start()
        .getPromise();
});

val latch = new CountDownLatch(1);

// Use it in the business logic code
loadFile.apply("fileNotFound.txt")
.onComplete(result -> {
    // Process result
    logs.add(result.toString());
    
    latch.countDown();
});

latch.await();

// Notice the error is sent in the same channel
assertEquals("[Result:{ Exception: java.nio.file.NoSuchFileException: path1 }]", logs.toString());
"""
        ]


taskExample =
    Example "Task"
        [ p []
            [ text "Task encapsulate the creation of promise (which is one-time use only) and that Task can be reused."
            ]
        , codeShow """
// Define task
val wordCountOf = f((String fileName) -> 
        Task.from(()->Files.readAllBytes(Paths.get(fileName)))
        .map(String::new)
        .map(matches("[a-zA-Z]+"))
        .map(theResults.texts)
        .map(StreamPlus::size)
);
// Define operations -> Notice that this is a generic operation -- no mention of Task.
val compareWordCount = f((Integer count1, Integer count2) -> {
    return (count1 == count2) ? "Same size."
         : (count1 >  count2) ? "First file is larger."
                              : "Second file is larger.";
});

// Declare tasks
val task1 = wordCountOf.apply("../LICENSE");
val task2 = wordCountOf.apply("../.travis.yml");
// Compose the tasks
val compareTask = compareWordCount.applyTo(task1, task2);

// At this point, nothing is run.

// Actually run
assertEquals("First file is larger.", compareTask.createAction().getResult().get());
// Reuse again
assertEquals("First file is larger.", compareTask.createAction().getResult().get());
"""
        ]


taskStore =
    Example "Store"
        [ p []
            [ text "Store makes it a bit easier to apply change to immurable object without having to create many variables."
            ]
        , codeShow """
// The operation.
val apppend = f((String str) -> f((FuncList<String> list)-> list.append(str)));

val list = FuncList.of("One", "Two");
val store = new Store<>(list);


assertEquals("[One, Two]", store.value().toString());

// Apply multiple changes.
store
.change(
    apppend.apply("Three"),
    apppend.apply("Four"),
    apppend.apply("Five"),
    apppend.apply("Six")
);
assertEquals("[One, Two, Three, Four, Five, Six]", store.value().toString());
"""
        ]
