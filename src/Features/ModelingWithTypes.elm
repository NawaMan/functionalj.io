module Features.ModelingWithTypes exposing (featModelingWithTypes)

import CodeBlock exposing (codeBlock)
import Feature exposing (Example, Feature, codeShow)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featModelingWithTypes =
    Feature title
        description
        [ exampleStruct
        , exampleStructWithLens
        , exampleChangeLens
        , exampleExhaustiveBuilder
        , exampleStructValidation
        , exampleChoiceType
        , exampleValidateEmailRuleType
        ]


title =
    "Modeling with Types"


description =
    """
        Struct (product), Choice (sum) and Rule types together make it easier to make illegal data unrepresentable.
        Struct with lens, exhaust builder and quick validatiion.
        Choice comes with pattern matching-like method.
        Rule types add contrains to existing classes.
      """


exampleStruct =
    Example "Struct for immutable data types"
        [ p [] [ text "@Struct is used to create an immutable data type." ]
        , codeShow """
@Struct
void Person(
        String firstName,
        @Nullable
        String middleName,
        String lastName,
        @DefaultTo(DefaultValue.MINUS_ONE)
        Integer age) {}

...
val person = new Person("John", "Doe");
// Access the field
assertEquals("John", person.firstName);
assertEquals("Doe",  person.lastName);
// Access the field using method
assertEquals("John", person.firstName());
assertEquals("Doe",  person.lastName());
// Access the field using lens (static import Person.thePerson)
assertEquals("John", thePerson.firstName.apply(person));
assertEquals("Doe",  thePerson.lastName.apply(person));
// toString() - notice default value for the absent fields.
assertEquals("Person[firstName: John, middleName: null, lastName: Doe, age: -1]", person.toString());
"""
        ]


exampleStructWithLens =
    Example "Lens for Struct"
        [ p [] [ text "A Struct type come with lens -- function to access both read/change the object properties." ]
        , codeShow """
@Struct
void Employee(
        String firstName,
        String lastName) {}
        
@Struct
void Department(
        String   name,
        Employee manager) {}

...
val departments = FuncList.of(
        new Department("Sales",   new Employee("John", "Doe")),
        new Department("R&D",     new Employee("John", "Jackson")),
        new Department("Support", new Employee("Jack", "Johnson"))
);
// Read lens                                           
assertEquals("[Doe, Jackson, Johnson]",
// Read lens                 vvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
             departments.map(theDepartment.manager.lastName).toString());
"""
        ]


exampleChangeLens =
    Example "Change lens"
        [ p [] [ text "Change lens can immutably modify the property of an object deep in the object tree" ]
        , codeShow """
@Struct
void Employee(
        String firstName,
        String lastName) {}
        
@Struct
void Department(
        String   name,
        Employee manager) {}

...
val employee   = new Employee("John", "Doe");
val department = new Department("Sales", employee);
assertEquals(
        "Department[name: Sales, manager: Employee[firstName: John, lastName: Doe]]",
        department.toString());

// Change lens    vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
val department2 = theDepartment.manager.firstName.changeTo("Jonathan").apply(department);
assertEquals(
        "Department[name: Sales, manager: Employee[firstName: Jonathan, lastName: Doe]]",
        department2.toString());
"""
        ]


exampleExhaustiveBuilder =
    Example "Exhaustive Builder"
        [ p [] [ text "Struct comes with an exhaustive builder." ]
        , codeShow """
@Struct
void Person(
        String firstName,
        @Nullable
        String middleName,
        String lastName,
        @DefaultTo(DefaultValue.MINUS_ONE)
        Integer age) {}

...
val person = new Person.Builder()
        .firstName ("John")
        .middleName("F")
        .lastName  ("Kookies")
        .build();
assertEquals("Person[firstName: John, middleName: F, lastName: Kookies, age: -1]", person.toString());
"""
        ]


exampleStructValidation =
    Example "Struct validation"
        [ p [] [ text "Struct can have a validation to ensure valid values." ]
        , codeShow """
@Struct
static String Circle(int x, int y, int radius) {
    return radius > 0 ? null : "Radius cannot be less than zero: " + radius;
}

...
val validCircle = new Circle(10, 10, 10);
assertEquals("Circle[x: 10, y: 10, radius: 10]", validCircle.toString());

try {
    new Circles(10, 10, -10);
    fail("Except a ValidationException.");
} catch (ValidationException e) {
    assertEquals(
            "functionalj.result.ValidationException: Radius cannot be less than zero: -10", 
            e.toString());
}
"""
        ]


exampleChoiceType =
    Example "Choice type"
        [ p [] [ text "Choice type allow ad-hoc variant of value. It also comes with pattern matching." ]
        , codeShow """
@Choice
interface LoginStatusSpec {
    void Login(String userName);
    void Logout();
}

...
val f = Func.f((LoginStatus status) -> {
    return status.match()
            .login (s -> "User: " + s.userName()) 
            .logout("Guess");
});

LoginStatus status1 = LoginStatus.Login("root");
LoginStatus status2 = LoginStatus.Logout();

assertEquals("User: root", f.apply(status1));
assertEquals("Guess",      f.apply(status2));
"""
        ]


exampleValidateEmailRuleType =
    Example "Valid Email"
        [ p [] [ text "Valid email is a string that fit a certain pattern." ]
        , codeShow """
@Rule static String Email(String emailStr) {
    return (emailStr.matches("^[^@]+@[^.]+\\..{1,3}$"))
            ? null
            : ("Not a valid email address: " + emailStr);
}

assertEquals("Email:{ Value: name@email.com }",                               "" + Email.from("name@email.com"));
assertEquals("Email:{ Invalid: Not a valid email address: name_email.net }",  "" + Email.from("name_email.net"));
"""
        ]
