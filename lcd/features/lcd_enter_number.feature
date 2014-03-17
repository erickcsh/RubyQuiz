Feature: Display number

  As a user
  I want to enter a number
  So I can see it displayed as an lcd number

  Scenario Outline: no size defined
    Given I started the program
    When I enter the number <number>
    Then I see <display>

    Examples:
      | number    | display      |
      |   0       |  ZERO_SIZE_2 |
      | 123456789 |  LONG_SIZE_2 |

  Scenario Outline: size defined
    Given I started the program
    When I enter the number <number>
    And I enter the size <size>
    Then I see <display>

    Examples:
      | number    | size |  display    |
      |   0       |  1   | ZERO_SIZE_1 |
      | 123456789 |  1   | LONG_SIZE_1 |

