Feature: Manage orders
  In order to manage orders
  As an user
  I want to be able to manipulate orders

  Scenario: See my orders
    Given I am on the home page
    And I am loged in
    When I go to my orders
    Then I should see "Order details"

  Scenario: Create a valid order
    Given I am on the home page
    And I am loged in 
    And I have food places
    When I follow "order_now"
    And I  select a food place
    And I check "invitedu_id_"
    And I press "create_order" 
    Then I should see "Edit order" 
    And I should have 1 order

  Scenario: See a specific order
    Given I am on the home page
    And I am loged in
    And I have food places
    And I have orders
    And I go to my orders
    When I go to one specific order
    Then I should see details of that order

  Scenario: Add menu line items to an order
    Given I am on the home page
    And I am loged in
    And I have food places
    And I have orders
    And I have menu options
    And I edit an order
    And I follow "add_line_item"
    When I press "update_order"
    Then the order should be updated
    And I should see a new line item in the order      
  
  @javascript
  Scenario: Mark a menu line item as payed
    Given I am on the home page
    And I am loged in
    And I have food places
    And I have menu options
    And I have orders with menu line items
    And I go to my orders
    And I follow one order's details
    When I check payed
    Then I should see the line item as paid
