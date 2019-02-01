module Features.Lens exposing (featLens)

import CodeBlock exposing (codeBlock)
import Feature exposing (..)
import Html exposing (Html, button, code, div, h1, p, span, text)
import Html.Attributes exposing (class, id)


featLens =
    Feature "Lens"
    """
    Lenses are functions to access to fields of an object -- both read and write.
    As functions, they can composed with others.
    """
    [ -- 0
      [ p []
            [ text "Access (read-only part of Lens) is a function to get field value of an object."
            ]
      , codeShow """
public class User {
    private String name;
      
    public User(String name) {
        this.name = name;
    }
    public String name() {
        return name;
    }
    public String toString() {
        return "User(" + name + ")";
    }
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
    ]
