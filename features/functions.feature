Feature: Functions

We should be able to define and call our own functions.


Scenario: Function definition (single expression)
  Given the program:
    """
    hello = function() { puts("Hello, World!") }
    hello()
    """
  When the program is executed
  Then the output should be:
    """
    Hello, World!
    """
  And the exit code should be 0


Scenario: Function definition (multiple expressions)
  Given the program:
    """
    hello = function() {
      puts("Hello,")
      puts("World!")
    }
    hello()
    """
  When the program is executed
  Then the output should be:
    """
    Hello,
    World!
    """
  And the exit code should be 0


Scenario: Function return (explicit)
  Given the program:
    """
    two = function() : Integer {
      return 2
    }
    exit(two())
    """
  When the program is executed
  Then the output should be:
    """
    """
  And the exit code should be 2
