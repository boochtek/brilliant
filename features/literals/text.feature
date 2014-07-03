Feature: Text Literals

We use the term "text" instead of "string", because it's a more generic term.
A string is actually a specific data structure for storing text.
Text can also be stored in a data structure called a rope.

Note that text is enclosed in double quotes, not single quotes.
Single quotes denote atoms, not text.


Scenario: Quoted Text literals
  Given the program:
    """
    puts("Hello, World!")
    """
  When the program is executed
  Then the output should be:
    """
    Hello, World!
    """
  And the exit code should be 0


Scenario: Quoted Text literals that include (escaped) double quotes.
  Given the program:
    """
    puts("Hello, \"World!\"")
    """
  When the program is executed
  Then the output should be:
    """
    Hello, "World!"
    """
  And the exit code should be 0
