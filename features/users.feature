Feature: Users
  In order to interact with the site
  As an user
  I want to have user privileges

Scenario: Sign up as an user
    Given I am on the home page
    And I press "sign_in"
    And I follow "sign_up"
    And I fill in "user_email" with "test@example.com"
    And I fill in "user_username" with "test"
    And I fill in "user_password" with "12345678"
    And I fill in "user_password_confirmation" with "12345678"
    When I press "Sign up"
    Then I go to the home page