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
    Then I click on add product button and verify the error message
      | Error                |
      | Location is required |
    Then I navigate to account setup page internally
    Then I navigate to IHP page
    Then I search for the product in IHP page manually with global catalog number
    And I update the preference for product with zero quantity
      | Preference |
      | Location   |
    And I click on save to save the preferences
    And I confirm the popup message and verify the toaster message

  @inventoryHandlingPreferences @regression
  Scenario: When RFID tracking preference is enabled, Location tracking preference should be enabled by default and cannot be disabled
    Given I navigate to create product screen
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I navigate to account setup page internally
    Then I navigate to IHP page
    Then I search for the product in IHP page manually with global catalog number
    And I update the disabled preference
      | Preference |
      | RfidTag    |
    And I verify the popup content
      | Header                   | Content                                                 |
      | Changing an RFID Product | Location Preferences Are Required for All RFID Products |
    And I click on turn location tracking for an RFID product checkbox
    And I update the preference for product with zero quantity
      | Preference |
      | Location   |
    And I update the preference for product with zero quantity
      | Preference |
      | RfidTag    |
    And I click on save to save the preferences
    And I confirm the popup message and verify the toaster message

  @inventoryHandlingPreferences @regression 
  Scenario: Turning off lot number preference for a single product with Q>0 disabling->enabling
    Given I navigate to create product screen
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I navigate to account setup page internally
    Then I navigate to IHP page
    Then I search for the product in IHP page manually with global catalog number
    And I update the preference for product with zero quantity
      | Preference   |
      | Location  |
    And I click on save to save the preferences
    And I confirm the popup message and verify the toaster message
    Then I go to inventory and add the product to inventory
      | TRANSACTION TYPE | LOT Number |
      | Add              |      12345 |
    Then I navigate to account setup page internally
    Then I navigate to IHP page
    Then I search for the product in IHP page manually with global catalog number
    And I update the disabled preference
      | Preference   |
      | Location     |
    And I verify the popup header
      | Header                               |
      | Changing existing product preference |
    And I check Are you sure you want to proceed checkbox and click on confirm
    And I click on save to save the preferences
    And I confirm the popup message and verify the toaster message
    And I update the enabled preference
      | Preference |
      | LotNumber  |
    And I verify the popup content
      | Header                               | Content                                             |
      | Changing existing product preference | you must first remove ALL instances of this product |

  @inventoryHandlingPreferences @regression 
  Scenario: Changing Supply designation of a product to Implant designation when product has Q=0
    Given I navigate to create product screen
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I navigate to account setup page internally
    Then I navigate to IHP page
    Then I search for the product in IHP page manually with global catalog number
    And I update the supply designation
      | Preference       |
      | implantProduct   |
    And I verify the popup header
      | Header                                |
      | Changing an supply designated product |
    And I click on confirm button for designation change
    And I click on save to save the preferences
    And I confirm the popup message and verify the toaster message