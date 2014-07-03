Feature: Integer Literals

Integers


Scenario: Decimal integer literal
  Given the program:
    """
    exit(123)
    """
  When the program is executed
  Then the exit code should be 123


Scenario: Hexadecimal integer literal
  Given the program:
    """
    exit(0x7B)
    """
  When the program is executed
  Then the exit code should be 123


Scenario: Octal integer literal
  Given the program:
    """
    exit(0o173)
    """
  When the program is executed
  Then the exit code should be 123


Scenario: Binary integer literal
  Given the program:
    """
    exit(0b1111011)
    """
  When the program is executed
  Then the exit code should be 123


Scenario: Just starting with a 0 does NOT make it octal
  Given the program:
    """
    exit(0100)
    """
  When the program is executed
  Then the exit code should be 100


