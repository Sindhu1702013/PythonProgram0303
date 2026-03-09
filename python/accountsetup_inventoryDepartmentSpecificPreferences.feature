Feature: Inventory Handling Preferences

  @inventoryHandlingPreferences @regression
  Scenario: Turning ON/OFF IHP preference for a supply product with Q=0
    Given I navigate to create product screen
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I navigate to account setup page internally
    Then I navigate to IHP page
    Then I search for the product in IHP page manually with global catalog number
    And I update the preference for product with zero quantity
      | Preference |
      | Location   |
    And I click on save to save the preferences
    And I confirm the popup message and verify the toaster message
    Then I navigated to inventory module page internally
    Then I select the product and enter the lot number
      | LOT Number |
      |      12345 |