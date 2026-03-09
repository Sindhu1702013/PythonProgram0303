Feature: Account Setup - Product Page

  @sprint0.14 @productPreferences @descriptionAliasToggle
  Scenario: verify the product preferences showing desription alias on product search page
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the product preferences page
    When I will enable the description alias checkbox if it is already enabled then i will handle
    Then I navigate to product search page internally
    And I search for the product in product search page
    Then I verify the description alias is displayed to user

  @sprint0.14 @productPreferences @costCenter @manufacturer @testrun
  Scenario: Verify the costcenter functionality by changing the costcenter for a manufacturer
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the cost center page
    Then i will verify the heading of the page
    When I will capture the manufacture name and change the cost center for that manufacturer
    Then I will verify the cost center is updated for the manufacturer by searching in the product search page

  @sprint0.14 @productPreferences @brand @costCenter
  Scenario: Verify the costcenter functionality by changing the costcenter for a brand
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the cost center page
    Then i will verify the heading of the page
    When I will capture the brand name and change the cost center for that brand
    Then I will verify the cost center is updated for the brand by searching in the product search page

  @sprint0.14 @productPreferences @costCenter @productType
  Scenario: Verify the costcenter functionality by changing the costcenter for a product type
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the cost center page
    Then i will verify the heading of the page
    When I will capture the product type name and change the cost center for that product type
    Then I will verify the cost center is updated for the product type by searching in the product search page

  @sprint0.14 @productPreferences @ourBillingCode
  Scenario: Verify the our billing code page search functionality and viewBy dropdown functionality
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the our billing code page
    Then i will verify the billing code page heading
    When I will select product type options from the viewBy dropdown
    Then I will be able to see only product type options below
      | product type |
      | access set   |
    When I will select manufacturer options from the viewBy dropdown
    Then I will be able to see only manufacturer options below
      | manufacturer           |
      | 0001_Aviation Products |
    When I Search for a particular manufacturer in the search field
      | manufacturer           |
      | 0001_Aviation Products |
    Then I will be able to see the searched manufacturers only

  @sprint0.14 @productPreferences @glCodes
  Scenario: Verify the glCode page search functionality and viewBy dropdown functionality
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the glCodes page
    Then i will verify the glCodes page heading
    When I will select product type options from the viewBy dropdown in glcodes page
    Then I will be able to see only product type options below in glcodes page
      | product type |
      | access set   |
    When I will select manufacturer options from the viewBy dropdown in glcodes page
    Then I will be able to see only manufacturer options below in glcodes page
      | manufacturer           |
      | 0001_Aviation Products |
    When I Search for a particular manufacturer in the search field in glcodes page
      | Manufacturer Name      |
      | 0001_Aviation Products |
    Then I will be able to see the searched manufacturers only in glcodes page

  @sprint0.14 @productPreferences @pricing
  Scenario: Verify the pricing functionality in product preferences page
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the pricing page
    Then I verify the page heading of the pricing page
    When I click on the product type dropdown
    And I select the manufacturer and brand
    And I will provide the our cost
      | Our Cost |
      |      320 |
    And I will enter the markup percentage and click on set all button
      | Markup percentage |
      |                10 |
    Then I verify the toaster message
      | Message                            |
      | Brand pricing updated successfully |

  @sprint0.14 @productPreferences @orderProductId
  Scenario: Verify the order product id functionality in product preferences page
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the edit order product id page
    Then i will verify the page heading of the our order id page
    When I click on the product type dropdown
    And I select the manufacturer and brand
    And I will enter the our order id
      | Our Order ID |
      |         1234 |
    Then I verify the toaster message
      | Message                              |
      | Hospital product order id's updated. |
  @sprint0.16 @productPreferences @descriptionAlias @sprint0.16
  Scenario: Verify the description alias functionality in product preferences page
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the description aliases page
    Then I will verify the description Alias page heading
    When I click on the product type dropdown
    And I select the manufacturer and brand
    And I will enter the description alias in the provided field
      | Description Alias      |
      | Test Description alias |
    And i will click on the save button
    Then I verify the toaster message
      | Message                  |
      | Item description updated |

  @sprint0.14 @productPreferences @descriptionAlias
  Scenario: Verify the description alias functionality in product preferences page
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the description aliases page
    When I click on the product type dropdown
    And I select the manufacturer and brand
    And I will enter the description alias in the provided field for all the products
      | Description Alias              |
      | Test Description alias for all |
    And I will click on the set all button
    Then I verify the toaster message
      | Message                  |
      | Item description updated |
    Then I will verify the description is set for all the products

  @sprint0.14 @productPreferences @supplierProducts @searchFunctionality
  Scenario: Verify the supplier products page search functionality
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the supplier products page
    Then I will verify the supplier products page heading
    When I Search for a particular manufacturer in the search field in supplier products page
    Then I will be able to see the searched manufacturers only in supplier products page

  @sprint0.14 @productPreferences @supplierProducts @supplierAdd @deleteFunctionality
  Scenario: Verify the supplier products page search functionality
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the supplier products page
    Then I will verify the supplier products page heading
    When I click on add supplier button and verify the page is opened
    Then I will verify the create new supplier panel

  @countSheets @productPreferences @existingTemplate
  Scenario: verify the creating a new Count sheet form from a existing template
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the count sheets page
    Then I verify the count sheet forms page heading
    When I click on the create new form
    And create a new count sheet form from a template
    Then I verify the count sheet form is created successfully
    When I create a new catageory under the created count sheet form
    Then I will verify the catageory is created
    And I will delete the created form and verify it is deleted

  @countSheets @productPreferences @newTemplate
  Scenario: verify the creating a new Count sheet form without using a template
    Given I navigate to the Account setup page from the dashboard
    And I navigate to the count sheets page
    When I click on the create new form
    And I will provide form name and manufacture name
    Then I verify the count sheet form is created successfully
    When I create a new catageory under the created count sheet form
    Then I will verify the catageory is created
    And I will verify that i am able to add any products
      | Catalog Number |
      | true100        |
    And I will delete the created form and verify it is deleted
