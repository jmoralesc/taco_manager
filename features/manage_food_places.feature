
Feature: Manage food places
  In order to manage food places
  As an user
  I want to be able to manipulate food places

  Scenario: See all food places
    Given I am on the home page
    When I go to food places
    Then I should see "Food places"

  Scenario: Create valid food place
    Given I have no food places
    And I am on the home page
    And I am loged in
    When I go to food places
    And I follow "New food place"
    And I fill in "food_place_name" with "fondita"
    And I fill in "food_place_phone_number" with "1234568"
    And I fill in "food_place_time" with "12"
    And I fill in "food_place_address1" with "Jesus Alcaraz #597"
    And I fill in "food_place_address2" with "El porvenir"
    And I fill in "food_place_state" with "Colima"
    And I fill in "food_place_city" with "Colima"
    And I press "create_food_place"  
    Then I should have 1 food place
    And I should see "fondita"

  Scenario: Display a specific food place
    Given I am on food places
    And I am loged in
    And I have food places
    When I go to one specific food place
    Then I should see details of that food place
  

  Scenario: Rate a food place
    Given I am on the home page 
    And I am loged in
    And I have food places
    And I go to food places
    And I follow one food place
    When I rate that food place
    Then I go to that food place

  @javascript
  Scenario: Select the display style
    Given I am on the home page 
    And I am loged in
    And I have food places
    And I go to food places
    When I select "List"
    Then I should see food places displayed in "list"
  

