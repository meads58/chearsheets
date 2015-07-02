Feature: user login

  Scenario: As a new unregistered user tring to log in the won't be allowed
    Given I am at the login screen
    When I fill in username with "tester"
    And I fill in password with "testing"
    And I press "login"
    Then I should see "User Not Found" message
    And be at the "/" "home" page

  Scenario: As a new user who wants to register they can register
    Given I am at the login screen
    When I press "register"
    And I fill in username with "me"
    And I fill in password with "test"
    And I press "submit"
    Then I should see "Welcome me" message
    And be at the "/user/profile:from/:to" "user profile" page

  Scenario: As a regsitered user they can log in
    Given I am at the login screen
    When I fill in username with "user1"
    And I fill in password with "test"
    And I press "login"
    Then I should see "Welcome user1" message
    And be at the "/user/profile:from/:to" "user profile" page

