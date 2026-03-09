Feature: Inventory General Preference

  #@smoke @regression @generalPreference @9thMay
  Scenario: Account Set up Inventory Handling General Preferences - Lot and Expiration Handling
    Given I navigated to inventory preferences page and select preference
      | Preference Name     |
      | general-preferences |
    Then I enable the inventory general preference and save the preference
      | Inventory Preference Name        |
      | lot-number-handling-checked      |
      | expiration-date-handling-checked |
    Then I navigate to create product screen internally
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I navigated to inventory module page internally
    Then I select the product and enter the lot number
      | LOT Number |
      |      12345 |
    Then I verify the preferences in IHP panel
      | Preference Name |
      | lot             |
      | expiration      |
      Then I verify the preferences in IHP panel
      | Preference Name |
      | lot             |
      | expiration      |

  #@smoke @regression @generalPreference @9thMay
  Scenario: Account Set up Inventory Handling General Preferences - Expired Product Warning and Expiration Date Limits
    Given I navigated to inventory preferences page and select preference
      | Preference Name     |
      | general-preferences    |
    Then I enable the inventory general preference and save the preference
      | Inventory Preference Name       |
      | expired-product-warning-checked |
      | expiration-date-limits-checked  |
    Then I enter the expiry date limits and save the preference
      | Near expiry limit | Restriction limit |
      |                 1 |                 2 |
    Then I navigate to create product screen internally
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    And I navigated to inventory module page internally
    Then I search for the product manually with global catalog number
    And I enter the past date as expiry date and check for the warning message
    And I enter the future date as expiry date and check for the waning message

  #@smoke @regression @generalPreference @9thMay
  Scenario: Account Set up Inventory Handling General Preferences - New Product Control Panel
    Given I navigated to inventory preferences page and select preference
      | Preference Name     |
      | general-preferences |
    Then I enable the inventory general preference and save the preference
      | Inventory Preference Name         |
      | new-product-control-panel-checked |
    Then I navigate to create product screen internally
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I go to inventory and add the product to inventory
      | TRANSACTION TYPE | LOT Number |
      
      | Add              |      12345 |
    Then I verify New Product Control Panel is displayed


@smoke @regression @generalPreference @parLevel @OneclickRemoveBTn
  Scenario: Account Set up Inventory Handling General Preferences - PAR level and one click removal button
    Given I navigated to inventory preferences page and select preference
      | Preference Name     |
      | general-preferences |
    Then I enable the inventory general preference and save the preference
      | Inventory Preference Name         |
      | par-level-tracking-checked        |
      | one-click-product-removal-checked |
    Then I navigate to parlevels page internally
    When I change the par level for a product 
    Then I should be able to see a confirm modal requesting for a reason to update par levels 
     Then I navigate to remove product screen internally
    Then I select the product and enter the lot number
      | LOT Number |
      |      12345 |
      Then I verify the remove button is displayed on remove inventory page
    


   