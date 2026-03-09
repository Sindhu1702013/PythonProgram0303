Feature: Encounter Preferences

  @smoke @regression @1august2025 @encounterpreferences @endtoend
  Scenario: User adds procedure codes , verifies in encounter , edits and deletes the procedure code
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I select specific department from department dropdown
      | Department Dropdown                                | Department Name |
      | account-setup-general-preference-department-select | Radiology       |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name                     |
      | showProceduresPerformedSection                |
      | showCptCodeModifiers                          |
      | requireProcedureRoomBeforeFinishingEncounters |
    Then I selected the section
      | Section Name    |
      | procedure-codes |
    Then I click on edit button and edit and save the procedure code
      | Procedure Code      |
      | Procedure Code Test |
    Then I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    And I click on encounter details button
    And I verify the procedure code in the dropdown
      | Procedure Code      |
      | Procedure Code Test |
    Then I navigate to encounter preferences page internally
      | Preference Name |
      | procedure-codes |
    Then I delete the first procedure code

  @1august2025 @encounterpreferences @endtoend
  Scenario: User adds procedure room , verifies room in encounter , edits deletes the procedure room
# Add procedure rooms
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name                     |
      | requireProcedureRoomBeforeFinishingEncounters |
    Then I selected the section
      | Section Name    |
      | procedure-rooms |
    When I click on button to add a new record
    Then I enter the room name and save the room
      | Room Name |
      |    01Room |
    Then I verify the toaster message
      | Message             |
      | successfully added! |
    Then I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    And I click on encounter details button
    And I verify the procedure room in the dropdown
      | Procedure Room |
      |         01Room |
    Then I navigate to encounter preferences page internally
      | Preference Name |
      | procedure-rooms |
    Then I edit the newly added room name
      | Procedure Room |
      |         01Room |
    Then I delete the newly added record
      | Record Name  |
      |01Room Edited |

  @1august2025 @encounterpreferences @endtoend
  Scenario: User adds custom encounter , verifies encounter in encounter details page , edits and deletes the procedure room
# Add custom encounter
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name                            |
      | showAndRequireEncounterTypeBeforeFinishingEncounters |
    Then I selected the section
      | Section Name     |
      | custom-encounter |
    When I click on button to add a new record
    Then I enter the encounter name
      | Encounter Type   |
      | Custom Encounter |
    Then I verify the toaster message
      | Message               |
      | created successfully! |
    Then I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    And I click on encounter details button
    And I verify the encounter type in the dropdown
      | Encounter Type   |
      | Custom Encounter |
    Then I navigate to encounter preferences page internally
      | Preference Name  |
      | custom-encounter |
    Then I edit the newly added encounter name
      | Encounter Type   |
      | Custom Encounter |
    Then I delete the newly added encounter record
      | Record Name             |
      | Custom Encounter Edited |

  @1august2025 @encounterpreferences @endtoend
  Scenario: User adds visit types , verifies visit type in patient details page , edits and deletes the visit type
# Add visit types
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name |
      | showVisitType             |
    Then I selected the section
      | Section Name |
      | visit-types  |
    When I click on button to add a new record
    Then I enter the visit type name
      | Visit Type Name |
      | Test Visit Type |
    Then I verify the toaster message
      | Message             |
      | successfully added! |
    Then I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Patient Search page
    And I click on add new patient button and verify the visit type dropdown
      | Visit Type      |
      | Test Visit Type |
    Then I navigate to encounter preferences page internally
      | Preference Name |
      | visit-types     |
    Then I edit the newly added visit type name
      | Visit Type      |
      | Test Visit Type |
    Then I delete the newly added record
      | Record Name             |
      | Test Visit Type Edited  |

  @1august2025 @encounterpreferences @endtoend
  Scenario: Enable modality , accesion number and patient location and verify in patien details page
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
      | OPD - 2         |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name |
      | showModality              |
      | showPatientLocation       |
      | showAccessionNumber       |
    Then I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Patient Search page
    And I search for existing patient and select and verify the patient details
    And I verify the modality , patient location and accession number fields in patient details page

  @14august2025 @encounterpreferences @endtoend
  Scenario: Enable ICD code input tool preference, add add the ICD code and verify in encounter details page
    ############### Add ICD code scenario ###############
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name |
      | showIcdCodeInputTool      |
    Then I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    And I click on encounter details button
    And I click on add ICD code button and add the ICD code details
    ############### Duplicate ICD code scenario ###############
    And I click on add ICD code button and add the ICD code details
    Then I verify the error message
      | Error Message                        |
      | This ICD code has already been added |
    ############# Reorder ICD codes scenario ###############
    And I add the new ICD code details
    Then I verify the toaster message
      | Message                     |
      | ICD Code added successfully |
    And I click on reorder arrow to reorder the ICD codes
    Then I verify the toaster message
      | Message             |
      | ICD Code moved down |

  @1august2025 @encounterpreferences @endtoend
  Scenario: Verify the error message when empty input is given and search the ICD code with no matching results
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name |
      | showIcdCodeInputTool      |
    Then I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    And I click on encounter details button
    And I click on add ICD code button and do not enter any details
    Then I verify the error message
      | Error Message                       |
      | Please select at least one ICD Code |

  @encounterpreferences @dynamicImplantInspection  @testdemo
  Scenario: verify the dynamic implant inspection prefernecess
    Given I navigate to create product screen
    Then I select specific department from department dropdown
      | Department Dropdown         | Department Name |
      | encounter-department-select | Radiology       |
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
    Given I navigated to implant and inspection module of account setup
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name        |
      | requireTissuePreparationMaterial |
      | showImplantInspectionTemperature |
      | requireTissuePreparer            |
      | allowImplantInspection           |
      | requireLeadPhysicianToggle       |
    Given I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    When I click on Skip to Documentation button and I land to Product log page
    And I search implant inspection product with the catalog number saved
    And I Enter lot number and click on confirm button
      | lot number |
      |      12345 |
    And I click on edit button and navigate to tissue inspection page
    Then I verify the fields in tissue inspection page & tissue preparation page
      | Field Name                               |
      | label-field-Measured Temperature         |
      | tissue-preparation-material-status-label |
  #    # | tissue-preparation-preparer              |


  @encounterpreferences @patientInfoScreen @sprint0.11 @sprint0.12
  Scenario: verify the encounter preferences for hospital account number , contact serial number
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name                            |
      | hospitalAccountNumber                                |
      | contactSerialNumber                                  |
      | showPatientExitDateAndTime                           |
      | showVisitNumber                                      |
      | showAndRequireEncounterTypeBeforeFinishingEncounters |
    Given I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Patient Search page
    When I search for existing patient and select and verify the patient details
    When I click on patient select button
    Then I verify the selected encounter preferences fields
      | Field Name                                  |
      | hospital-account-number-autocomplete-root   |
      | contact-serial-number-autocomplete          |
      | label-field-Patient Exit Time               |
      | label-field-Patient Exit Date               |
      | create-encounter-encounterType              |
      | create-encounter-encounterType-status-label |

  @encounterpreferences @allowInstantAdd @outofscope @workingSep30Ran 
  Scenario: verify the user should be able to instant add a product in encounter when the product is not available in the inventory
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name |
      | allowInstantAdds          |
    Given I navigate to create product screen internally
    Then I create a product and save it as global variable
      | Manufacturer           | Product Type |
      | 0001_Aviation Products | Access set   |
    Given I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    When I click on Skip to Documentation button and I land to Product log page
    And I search for a product which is not available in the inventory
    Then I verify the product is not available in the inventory and I should see a instant add button
     


  @encounterPreferences @allowEncounterToCreateNewProducts @sprint0.12
  Scenario: verify allowing user to create a new product if the product is not available in the inventory, when the preference is enabled
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name         |
      | allowEncounterToCreateNewProducts |
    Given I navigated to encounter page and verify page
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    When I click on Skip to Documentation button and I land to Product log page
    And I search for a product which is not available in the inventory
      | Product Name      |
      | NewCatalogProduct |
    Then I verify the product is not available in the inventory and I should see a instant add button
  # @productlog @encounterpreferences

  @encounterpreferences @productLog @pricetested @sprint0.11 @sprint0.12
  Scenario: verify the displaying of price paid when the preference is enabled
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name          |
      | showDepartmentPriceOnEncounterForm |
      | showContrastRecords                |
    Given I navigate to create product screen internally
    Then I create a product and save it as global variable
      | Manufacturer | Product Type |
      |   2view, LLC | Access set   |
    Given I navigate to encounter page internally
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    When I click on Skip to Documentation button and I land to Product log page
    And I search implant inspection product and select first result
    Then I verify the Price is shown in the UI
  # @billingSummmary @encounterpreferences

  @encounterPreferences @billingSummaryPreferences @sprint0.12
  Scenario: verify the billing summary form preferences
    Given I navigated to encounter preferences page ,verified page and select preference
      | Preference Name |
      | preferences     |
    Then I enable the encounter preference and save the preference
      | Encounter Preference Name          |
      | showDepartmentPriceOnEncounterForm |
      | showBarcodeOnBillSummaryForm       |
      | showCategoryCodeOnBillSummaryForm  |
    Given I navigated to encounter page and verify page
    When I click on CreateEncounter button, I should be navigated to Create Encounter page
    When I click on Skip to Documentation button and I land to Product log page
    And I search implant inspection product and select first result
      | catalog number |
      | saifortest     |
    And I Enter lot number and click on confirm button
      | lot number |
      | lotramtest |
    And I save the case id and click on save and review button
    And I navigate to billing summary page
    Then I verify the billing summary form preferences
      | Elements to validate    |
      | our-billing-code        |
      | barcode-billing-summary |
      | c-code-billing-summary  |
