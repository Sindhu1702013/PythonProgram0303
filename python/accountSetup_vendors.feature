Feature: Account Setup - Vendors Page

   Given I navigate to the Account setup page from the dashboard
   And I navigate to the vendors preferences page
   Then I verify the heading of the  contract numbers page 
   When I click on create new button 
   Then I verify the side panel with appropriate heading should be visible
   When I click on the Save contract button without providing details 
   Then I verify the error message should be visible
   Then I verify the mark this contract as active toggle is working 
   When I will click on close button
   And I will click on the Edit button of the existing contract
   Then I veify the header of the side panel and vendor name should be disable

  @vendors @hospitalAccountNumbers @vendorPreferences
  Scenario: Verify the vendors preferences Hospital Account numbers
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the vendors preferences Hospital account numbers page
    Then I verify the heading of the  Hospital account numbers page
    When I click on create new account number button
    Then I verify the create new Hospital account number screen
    When I click on edit button of the existing Hospital account number
    Then I verify the field is editable

  @vendors @departmentAccountNumbers @vendorPreferences
  Scenario: Verify the vendors preferences department Account numbers
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the vendors preferences department account numbers page
    Then I verify the heading of the  department account numbers page
    When I click on create new account number button
    Then I verify the create new Hospital account number screen
    When I click on edit button of the existing Hospital account number
    Then I verify the field is editable

  @vendors @hospitalManufacturerCodes @vendorPreferences
  Scenario: Verify the vendors preferences Hospital Manufacturer codes page
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the vendors preferences Hospital Manufacturer codes page
    Then I verify the heading of the  Hospital Manufacturer codes page
    When I click on create new Hospital Manufacturer code button
    Then I verify the create new Hospital Manufacturer code screen
    When I click on edit button of the existing Hospital Manufacturer code
    Then I verify the Hospital Manufacturer code field is editable
