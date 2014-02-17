Feature: Basic Operation

This is a test of the basic operation of the Brilliant compiler.
It will likely go away once we get the compiler generally working as expected.


Scenario: Expression
  Given the program:
    """
	123
	"""
  When the program is executed
  Then the exit code should be 123
