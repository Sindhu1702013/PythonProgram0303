Feature: Create Encounter and verify

  @smoke @regression @24march2025 @createencounter @NotInSheet @refined 
  Scenario: Create Encounter without entering patient details, productlog and verify missing details and cases list
    Given I navigated to encounter case page and varified page
    # And I capture total Cases number and save it for varification
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    And I click on Skip to Documentation button and I land to Product log page
    And I captured new Case ID and save it for varification
    And I click on View Encounter Details button and I land to Review Encounter page with missing details
    Then I click on Encounter and verify Encounter CaseID and status

  @regression @24march2025 @refined @createencounter @NotInSheet @regression @24march2025 @createencounter 
  Scenario: Create Encounter with creating new patient and verify the details
    Given I navigated to encounter case page and varified page
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    And I click on Add new Patient, enter patient details and add patient, verify patient detail page
      | lastName | firstName | gender | DOB        | zipCode |
      | LastName | FirstName | Male   | 11/11/1990 |   10004 |
    And I click on Skip to Documentation button and I land to Product log page

  @regression @24march2025 @createencounter @refined @endtoend 
  Scenario: Create Encounter with existing patient, and enter encounter and procedure details and verify the details and encounter status
    Given I navigate to create product screen
      Then I select specific department from department dropdown
      | Department Dropdown                               | Department Name |
      | encounter-department-select                       | OPD - 2         |
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I go to inventory and add the product to inventory
      | TRANSACTION TYPE | LOT Number |
      | Add              |      12345 |

##added here later need to chnage
  @regression @24march2025 @createencounter @refined @endtoend 
  Scenario: Create Encounter with existing patient, and enter encounter and procedure details and verify the details and encounter status
    Given I navigate to create product screen
    Then I select specific department from department dropdown
      | Department Dropdown                               | Department Name |
      | encounter-department-select                       | OPD - 2         |
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I go to inventory and add the product to inventory
      | TRANSACTION TYPE | LOT Number |
      | Add              |      12345 |
    Then I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Patient Search page
    And I search for existing patient and select and verify the patient details
    And I enter encounter details
    And I select the procedure details as and verify if CPT code and Our Procedure are autopopulated and save the details
    When I search supply product and select first result
    Then I enter the product details for the product identification
      | LOT Number |
      |      12345 |
    And I capture the LOT for verification
    And I click on edit icon and verify the product details
    And I add the product to product log
    And I captured new Case ID and save it for varification
    And I resume the encounter and mark it as completed

  @regression @24march2025 @createencounter @refined @endtoend 
  Scenario: Create encounter , addition of implant product to product log , site and side ,tissue inspection and preparation details
    Given I navigate to create product screen
     Then I select specific department from department dropdown
      | Department Dropdown                               | Department Name |
      | encounter-department-select                       | OPD - 2         |
    Then I create a implant product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Then I go to inventory and add an implant product to inventory
      | TRANSACTION TYPE | LOT Number |
      | Add              |      12345 |
    And I check for Pre-Inventory heading
    And I enter the reciever details
      | Reciever Name | Source Facility | Date Received | Time Received |
      | Charlie       | abc test        |      04122025 |         0425A |
    And I select the temprature status and reason
    And I save the inspection details
    Then I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    And I click on Skip to Documentation button and I land to Product log page
    When I search implant product and select first result
    Then I enter the product details for the product identification
      | LOT Number |
      |      12345 |
    And I capture the LOT for verification
    And I click on edit icon and verify the product details
    And I navigate to implant details page and enter the implant details
    And I navigate to tissue inspection page and enter inspection details
      | Temprature Type | Measured Temprature | Status | Is tissue preparation needed? |
      | Translated      | Cyropreserved       | passes | true                          |
    And I navigate to tissue preparation page and enter the details
    And I captured new Case ID and save it for varification
    Then I click on Encounter and verify Encounter CaseID and status
    And I resume the encounter and mark it as completed
    And I add the missing details of encounter
      | Index |
      |     1 |
    And I search for existing patient and select and verify the patient details
    And I enter encounter details
    And I enter procedure details and mark the encounter as completed
