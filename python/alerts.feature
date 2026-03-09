Feature: Verify the alerts
## validation of the UX 

  @alerts @loanedAndBorrowed @regression @testranOCT06 
  Scenario: verify the Loaned and Borrowed products are listed in the alerts screen are visible in loaned and borrowed sections in inventory
    Given I navigate to the Loaned & Borrowed product page from dashboard
    And I navigate to the Loaned and Borrowed products Alerts screen
    Then I Capture the Loaned and Borrowed products first entry catalog number and save as global catalog number
    Then I navigated to Loaned & Borrowed product page internally
    Then I search product in the page with global catalog number
    Then I verify if the product is visible with catalog number

  @alerts @loanedAndBorrowed @regression  @testranOCT06 
  Scenario: verify viewing and removing of products from Loaned and Borrowed products section
    Given I navigate to the Loaned & Borrowed product page from dashboard
    Then I Capture the Loaned and Borrowed products first entry catalog number and save as global catalog number
    Then I will click on the view button
    Then I verify the product details are displayed correctly
    And I navigate to the Loaned & Borrowed product page internally
    When I click on delete for the first product
    Then i will verify the successful deletion toast message
    Then I verify the toaster message
      | Message               |
      | loaned-borrowed-products-deleted-successfully |

  @alerts @backorder @regression @testranOCT06 
  Scenario: verify the backorder products are listed in the alerts screen are visible in backorder section in inventory
    Given I navigate to the backorder products Alerts screen from dashboard
    Then I Capture the backorder products first entry catalog number and save as global catalog number
    When I navigate to the Backordered Products page internally
    And I search for the product by global catalog number
    Then I verify the product exists with catalog number

  @alerts @backorder @regression @testranOCT06 
  Scenario: verify the viewing of backorder product and cancelling the backorder product
    Given I navigate to the backorder products Alerts screen from dashboard
    Then I Capture the backorder products first entry catalog number and save as global catalog number
    When I click on the cancel backorder product and confirm the action
    Then I will navigate to backorder alerts page internally
    Then I Capture the backorder products first entry catalog number and save as global catalog number
    When I click restore the backorder product
    Then I will verify the confirmation popup is displayed

  @alerts @expiredAlerts @working @testRanOCT07 
  Scenario: Product with expiry date as yesterday should appear in Expired products alerts
    Given I navigate to create product screen
    Then I select specific department from department dropdown
      | Department Dropdown              | Department Name |
      | encounter-department-select-root | QA Test Department         |
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I navigate to product search page internally
    Then I go to inventory and add the product to inventory with Expiration date
    And I navigate to the Expired products alerts screen
    Then I verify the saved catalog number is listed under Expired products alerts


##low stock alerts
##product quantity 80 need to be added (par 90 - 9 (10 % ls threshold) = 80
  @alerts @lowStockAlertsProductThreshold @TestRanOCT07 @working 
  Scenario: Verify if the product quantity is less than the parlevel threshold percentage appears in low stock alerts
    Given I navigate to create product screen
    Then I select specific department from department dropdown
      | Department Dropdown              | Department Name |
      | encounter-department-select-root | QA Test Department         |
    Then I create a product and save it as global variable
      | Manufacturer Name | Product Type |
      |        2view, LLC | Access set   |
    Then I go to inventory and add the product to inventory with quantity
      | quantity |
      |       80 |
    Then I navigate to product search page internally
    Then I search for the product in product search page
    Then I click on Search all products link
    Then I click on the edit button for first result and update the details
    Then I click on save details button
    And I navigate to the low stock alerts screen
    Then I verify the product catalog number appears in the low stock section

#---------------------------------------------------------------------------------------------##
##overstock alerts (parlevel and overstock percent should be provided by editing the product)
##product quantity 100 need to be added (AQ 100 , Par 90 + 9 (10% os threshold)= 99 
  @alerts @overStockAlertsProductThreshold @TestRanOCT07 @working  
  Scenario: verify if the product quantity is greater than parlevel threshold percentage appears in over stock alerts
    Given I navigate to create product screen
     Then I select specific department from department dropdown
      | Department Dropdown              | Department Name |
      | encounter-department-select-root | QA Test Department         |
    Then I create a product and save it as global variable
      | Manufacturer Name | Product Type |
      |        2view, LLC | Access set   |
    Then I go to inventory and add the product to inventory with quantity
      | quantity |
      |      150 |
    Then I navigate to product search page internally
    Then I search for the product in product search page
    Then I click on Search all products link
    Then I click on the edit button for first result and update the details
    Then I click on save details button
    And I navigate to the over stock alerts screen
    Then I verify the products catalog number appears in the overstock alerts section

  @alerts @expiredAlerts @regression @testranOCT06
  Scenario: Verify the Expired alerts page
    Given I navigate to the Expired Alerts screen from dashboard
    Then I verify the Expired alerts page is displayed correctly
    Then I will verify the sort button is clickable
    When I click on the Tab expired alerts
      | TAB_NAME    |
      | tab-expired |
    Then I will verify the Expired alerts page is selected
    When I click on the Tab near expired alerts
      | TAB_NAME              |
      | tab-nearingExpiration |
    Then I will verify the Near Expired alerts page is selected
##---------------------------sprint 0.11 ----------------------------------##

  @alerts @lowStockAlerts @alertsFilter @filterForProductType @Aug01 @sprint0.11 
  Scenario: Verify the filter functionality for product type in the low stock alerts page, selected product type should not be dispalyed in the results
    Given I navigate to the low stock alerts screen from dashboard
     Then I select specific department from department dropdown
      | Department Dropdown                    | Department Name |
      | lowstock-alerts-department-select-root | OPD - 2         |
    When I capture the first product type from the page
    Then I click on the filter button
    And I select the captured product type from the filter options
    And I navigate back to alerts page
    Then I verify the results are filtered based on the selected product type

  @alerts @lowStockAlerts @filterForManufacturer @sprint0.11 @alertsFilter 
  Scenario: verify the filter functionality for Manufacturer in the low stock alerts page, selected manufacturer should not be displayed in the results
    Given I navigate to the low stock alerts screen from dashboard
     Then I select specific department from department dropdown
      | Department Dropdown                    | Department Name |
      | lowstock-alerts-department-select-root | OPD - 2         |
    When I capture the first manufacturer from the page
    Then I click on the filter button
    And I select the captured manufacturer from the filter options
    And I navigate back to alerts page
    Then I verify the results are filtered based on the selected manufacturer

  @alerts @ExpiryAlerts @filterForProductType @sprint0.11 @alertsFilter 
  Scenario: verify the filter functionality for product type in the near expiry alerts page, selected product type should not be displayed in the results
    Given I navigate to the Expired alerts page from dashboard
     Then I select specific department from department dropdown
      | Department Dropdown                    | Department Name |
      | lowstock-alerts-department-select-root | OPD - 2         |
    When I capture the first product type from expiration page
    Then I click on the filter button
    And I select the captured product type from the filter options in expiration page
    And I navigate back to expired alerts page
    Then I verify the results are filtered based on the selected product type in expired alerts page

  @alerts @ExpiryAlerts @filterForManufacturer @sprint0.11 @alertsFilter 
  Scenario: verify the filter functionality for Manufacturer in the expired alerts page, selected manufacturer should not be displayed in the results
    Given I navigate to the Expired alerts page from dashboard
     Then I select specific department from department dropdown
      | Department Dropdown                    | Department Name |
      | lowstock-alerts-department-select-root | OPD - 2         |
    When I capture the first manufacturer from expiration page
    Then I click on the filter button
    And I select the captured manufacturer from the filter options in expiration page
    And I navigate back to expired alerts page
    Then I verify the results are filtered based on the selected manufacturer in expired alerts page

  @alerts @nearExpiredAlerts @filterForProductType @sprint0.11  @alertsFilter 

  Scenario: verify the filter functionality for product type in the near expiry alerts page, selected product type should not be displayed in the results
    Given I navigate to the Near Expired alerts page from dashboard
     Then I select specific department from department dropdown
      | Department Dropdown                    | Department Name |
      | lowstock-alerts-department-select-root | OPD - 2         |
    When I capture the first product type from expiration page
    Then I click on the filter button
    And I select the captured product type from the filter options in expiration page
    And I navigate back to Near expired alerts page
    Then I verify the results are filtered based on the selected product type in expired alerts page

  @alerts @nearExpiredAlerts @filterForManufacturer @sprint0.11  @alertsFilter 

  Scenario: verify the filter functionality for product type in the near expiry alerts page, selected product type should not be displayed in the results
    Given I navigate to the Near Expired alerts page from dashboard
     Then I select specific department from department dropdown
      | Department Dropdown                    | Department Name |
      | lowstock-alerts-department-select-root | OPD - 2         |
    When I capture the first manufacturer from expiration page
    Then I click on the filter button
    And I select the captured manufacturer from the filter options in expiration page
    And I navigate back to Near expired alerts page
    Then I verify the results are filtered based on the selected manufacturer in expired alerts page
##-------------------------Sprint0.12-------------------------------------##

  @alerts @reviewIndividualAlerts @sprint0.12 @testranOCT06 @reviewAlerts
  Scenario: Verify the review alerts page for individual product
    Given I navigate to the low stock alerts screen from dashboard
    Then I select specific department from department dropdown
      | Department Dropdown                    | Department Name |
      | lowstock-alerts-department-select-root | Radiology         |
    When I capture the first manufacturer name and select the checkbox of the product
    Then I verify the review seleted button is visible and I click on the review selected button
    Then I verify the user should be navigated to order worksheet screen
    Then I will verify the captured manufactured name is present in the order worksheet screen

  @sprint0.12 @alerts @reviewAllAlerts @sprint0.13 @testranOCT06 @reviewAlerts
  Scenario: verify the review alerts page for all products
    Given I navigate to the low stock alerts screen from dashboard
    Then I select specific department from department dropdown
      | Department Dropdown                    | Department Name |
      | lowstock-alerts-department-select-root | Radiology         |
    When I capture all manufacture names and select all checkboxes present in screen
    Then I verify the review seleted button is visible and I click on the review selected button
    Then I verify the user should be navigated to order worksheet screen
    Then I will verify all the orders were created with the captured manufacturer names

  #@lowstockalerts @thresholddefault @sprint0.12 @alerts @working @testRanOCT07 
  @thresholdDefaultAllProducts
  Scenario: verify the default threshold value set for low stock alerts account setup page
    Given I navigate to the Account setup page from the dashboard
     Then I select specific department from department dropdown
      | Department Dropdown              | Department Name |
      | account-setup-general-preference-department-select-root | QA Test Department         |
    When I navigate to the Lowstock alert page from the account setup page
    Then I verify the default threshold value is set to user defined
      | default threshold |
      |                10 |
    Given I navigate to the product creation screen
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I go to inventory and add the product to inventory with quantity
      | quantity |
      |       80 |
    Then I navigate to product search page internally
    Then I search for the product in product search page
    Then I click on Search all products link
    Then I edit the product details par level
   # Then I click on the edit button for first result and update the details
    Then I click on save details button
    And I navigate to the low stock alerts screen
    Then I verify the product catalog number appears in the low stock section

  @sprint0.12 @autoTransferAlerts @alerts @workaround 
  Scenario: Verify the Transferring Products from one dept to another department - Inventory Remove Page alerts
    Given I navigate to create product screen
    Then I select specific department from department dropdown
      | Department Dropdown              | Department Name |
      | encounter-department-select-root | QA Test Department       |
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I go to inventory and add the product to inventory
      | TRANSACTION TYPE | LOT Number |
      | Add              |      12345 |
    When I navigate to inventory remove page
    Then I search for the product in inventory remove page
    And I enter the lot number and select the remove transaction and transfer to department
      | Lot Number | Transaction type            | Department |
      |      12345 | Remove - Inter-Dept. Charge | OPD - 2    |
    And I provide the quantity to be removed and click on remove button
    Then I will verify the toast message
    Given I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    When I click on Skip to Documentation button and I land to Product log page
    And I search for saved catalog number and select it
    And I Enter lot number and click on confirm button
      | lot number |
      |      12345 |
    Given I navigate to the Auto-Transferred Inventory alerts screen
    Then I select specific department from department dropdown
      | Department Dropdown                          | Department Name |
      | auto-transferred-inventory-department-select |QA Test Department     |
    Then I verify the saved product catalog number is listed under Auto-Transferred Inventory alerts

  @alertsAccountSetup @alerts @sprint0.13 @testranOCT06
  Scenario: verify the account setup page for alerts inventory , autotransfer and Recalled products desciption alias is dispalyed if toggle enabled
    Given I navigate to Alerts account setup page
    When I will check the checkbox if it is already checked i will verify the text field is editable in inventory
    When I will check the checkbox if it is already checked i will verify the text field is editable in autotransfer
    When I will check the checkboxes in recalled products if already checked i will handle
    Then I will navigate to the recalled products alerts page
    And I verify the description alias is disaplayed to user

  @alerts @sprint0.14 @thresholdDefaultAllProducts @testranOCT06
  Scenario: Verify the setting deafult low stock alert threshold value for all products
    Given I navigate to the Account setup page from the dashboard
    When I navigate to the Lowstock alert page from the account setup page
    And I set the default threshold value to all products
      | default threshold |
      |                20 |
    Then I verify the successfull toast message is displayed
