Feature: user login

  Scenario: As a new unregistered user try an log in
    Given I am at the login screen
    When I fill in username with "tester"
    And I fill in password with "testing"
    And I press "submit"
    Then I should see "User Not Found" message

  Scenario: As a new user who wants to register
    Given I am at the login screen
    When I press "register"
    And I fill in username with "me"
    And I fill in password with "test"
    And I press "submit"
    Then I should see "Welcome me" message
    And be at the "main" page