@regression
Feature: Testing all operations of Calculator application
  All operations such as addition (+), subtraction (-), multiplication (x)
  and division (/) operations to be tested.

  @add
  Scenario Outline: To test addition operation
    Given calculator application is open
    When buttons <number1>, <operator>, <number2> are pressed    
    Then display section should display result as <result>
    And close the calculator application
	Examples:    
	|number1|operator|number2|result|
	| 10    |   +    |   10  |  20  |
	| 15    |   -    |   2   |  13  |
	|  4    |   *    |   5   |  20  |
	| 121   |   +    |   245 |  366 |
	| 100   |   /    |   10  |  10  |
	| 500   |   -    |   199 |  301 |