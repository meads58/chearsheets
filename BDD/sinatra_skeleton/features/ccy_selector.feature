Feature: Currency Api

  Scenario: Logged in user viewing my profile
    Given I am logged in
    When I reach my profile screen
    Then no "from" currency is selected
    And no "to" currency is selected