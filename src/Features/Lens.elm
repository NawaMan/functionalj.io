module Features.Lens exposing (featLens)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featLens =
    Feature title
        description
        [ exampleReadAccess
        , exampleWriteLens
        ]


title =
    "Access and Lens"


description =
    """
    Lenses are functions to access to fields of an object -- both read and write.
    As functions, they can composed with others.
      """


exampleReadAccess =
    Example "Read property with access"
        [ p [] [ text "Access (read-only part of Lens) is a function to get field value of an object." ]
        , codeShow """
// Given this data class
public class User {
    private String name;
      
    public User(String name) { this.name = name; }
    public String name() { return name; }
    public String toString() { return "User(" + name + ")"; }
}

    ...
    User user1 = new User("John");
    
    StringAccess<User> userName = User::name;
      
    // Use lens to get the field value
    assertEquals("John", userName.apply(user1));
      
    // StringAccess is composed to length() and thatGreaterThan(...)
    assertFalse(userName.length().thatGreaterThan(4).apply(user1));
    assertTrue (userName.length().thatGreaterThan(4).apply(new User("NawaMan")));
"""
        ]


exampleWriteLens =
    Example "Change property with lens"
        [ p [] [ text "Accesses and lenses compose. In this example, when use sub-lens to change, it change all the way up." ]
        , codeShow """
@Struct
void Employee(
        String firstName,
        String lastName) {}
        
@Struct
void Department(
        String   name,
        Employee manager) {};

    ...
    val employee   = new Employee("John", "Doe");
    val department = new Department("Sales", employee);
    assertEquals(
            "Department[name: Sales, manager: Employee[firstName: John, lastName: Doe]]",
            department.toString());
    
    // Change the first name of the manager
    val department2 = theDepartment.manager.firstName.changeTo("Jonathan").apply(department);
    assertEquals(
            "Department[name: Sales, manager: Employee[firstName: Jonathan, lastName: Doe]]",
            department2.toString());
    ...
"""
        ]
