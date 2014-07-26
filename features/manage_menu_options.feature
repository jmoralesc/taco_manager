Feature: Manage menu options
  In order to manage menu options
  As an user
  I want to be able to manipulate menu options

  @javascript
  Scenario: Add a valid menu option to one food place
    Given I am on the home page
    And I am loged in
    And I have food places 
    And I go to food places
    And I follow one food place
    And I edit that food place
    When I follow "add-option"
    And I fill in "menu_option_name" with "Taquito"
    And I fill in "menu_option_price" with "5"
    And I press "save"
    Then I should have 1 menu option
    Then I should see details of that food place

