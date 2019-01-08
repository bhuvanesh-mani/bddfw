@regression
Feature: Testing all operations of Calculator application
  All operations such as addition (+), subtraction (-), multiplication (x)
  and division (/) operations to be tested.

  @add
  Scenario: To test addition operation
    Given calculator application is open
    When buttons "45, +, 51, =" pressed
    Then display section should display result as "96"
    And close the calculator application

  @sub
  Scenario: To test subtraction operation
    Given calculator application is open
    When buttons "22, -, 10, =" pressed
    Then display section should display result as "2"
    And close the calculator application
    
  @multiply
  Scenario: To test multiplication operation
    Given calculator application is open
    When buttons "15, *, 5, =" pressed
    Then display section should display result as "75"
    And close the calculator application

  @divide
  Scenario: To test division operation
    Given calculator application is open
    When buttons "90, /, 9, =" pressed
    Then display section should display result as "10"
    And close the calculator application        
