Feature: Admin Flows

  @14august2025 @adminflows @endtoend @testRunSep25 @addEditManufacturer
  Scenario: Add Manufacturer
     ####### Add new manufacturer#####
    Given I navigate to add manufacturer page in admin module
    And I click on add new manufacturer button
    And I enter the manufacturer details and save the manufacturer
      | City  |
      | Texas |
    And I verify the successful manufacturer creation toaster message
      | Message                          |
      | Manufacturer saved successfully. |
    ### Add duplicate manufacturer
    And I click on add new manufacturer button
    And I enter a manufacturer which matches the existing manufacturer
      | City  |
      | Texas |
    Then I verify the popup header and confirm the popup
      | Header                   |
      | Similar Entries Detected |

  @14august2025 @adminflows @endtoend @addEditManufacturer @testRunSep25
  Scenario: Edit Manufacturer
    Given I navigate to add manufacturer page in admin module
    And I click on edit button of the first manufacturer
    And I edit the details of manufacturer
      | City       |
      | California |
    And I verify the toaster message
      | Message                          |
      | Manufacturer saved successfully. |

  @adminFlows @deletedOrders @sprint0.13 @testRunSep25
  Scenario: Verify the delete orders functionality , the order that got deleted should make an entry in the admin module deleted orders
    Given I create an order
    When I add 1 product, save added product catalog number
    And I Capture the date of the first order as orderdate and the auto number generator value
    When I delete the first order
    And I navigate to the admin module page, deleted orders page
    And I will provide the Hospital and Department name
      | Hospital                    | Department |
      | General Hospital - New York | Radiology  |
    And I will provide captured date as start date and end date as current date
    And I click on the search button
    And I search for the order by auto no
    Then I verify if the order got deleted and made an entry in the deleted orders

  @sprint0.12 @adminFlows @deletedEncounters @sprint0.13 @testRunSep25
  Scenario: verify the deleted encounter functionality, The encounters deleted should make an entry in the admin module deleted encounters
  ##  Given I navigated to encounter page and verify page
  ##### When I click on CreateEncounter button, I should be navigated to Patient Search page
   # When I search for existing patient and select and verify the patient details
   # And I click on skip documentation button
   # And I capture the patient MRN and Case ID and save it for verification
   # And I will navigate back to encounter cases page
   # Then I select specific department from department dropdown
   #   | Department Dropdown         | Department Name |
   #   | encounter-department-select | Radiology       |
   # Then I will verify the recently created encounter case is in the first row
   # And I will click on end date and capture the end date
   # When I will click on the delete button of the recently created encounter case id
    Given I navigate to the admin module page, encounter page
    When I will provide the Hospital and Department name
      | Hospital                    | Department |
      | General Hospital - New York | Radiology  |
    And I will provide captured date as start date as current date and end as +1
    And I click on the search button
    Then I verify the search button functionality by validating message or a record

  @sprint0.12 @deletedEncounters @edgeCase @sprint0.13 @testRunSep25
  Scenario: Verify the message for no encounter found
    When I navigate to the admin module page, encounter page from dashboard
    And I will provide the Hospital and Department name
      | Hospital                    | Department |
      | General Hospital - New York | Radiology  |
    And I will provide the start date as tomorrow and end date as +1
    And I click on the search button
    Then I verify the message for no encounter found

  @sprint0.12 @deletedOrders @edgeCase @sprint0.13 @testRunSep25
  Scenario: Verify the message for no deleted order found
    When I navigate to the admin module page, deleted orders page from dashboard
    And I will provide the Hospital and Department name
      | Hospital                    | Department |
      | General Hospital - New York | Radiology  |
    #And I will provide captured date as start date and end date as current date
    And I will provide the start date as tomorrow and end date as +1
    And I click on the search button
    Then I verify the message for no order found

  @addProduct @adminFlows @databaseEntry @sprint0.13 @sprint0.14 @testRunSep25
  Scenario: Verify the adding the product and alternate product ID in admin module
    Given I navigate to the add edit products page from dashboard
    And I search for the product manually with UPN number
    And I click on search button
    When I will provide all the required details
      | Quantity |
      |        1 |
    And I click on save deatils button
    Then I verify the toaster message for successful product addition
      | Message                                     |
      | Product added successfully to the database. |
    When I will click on Create alternate Id button and provide alternate product id
    And I click on add aletrnate id button
    Then i will verify the toast message

  @addProduct @adminFlows @databaseEntry @sprint0.13 @sprint0.14 @testRunSep25
  Scenario: verify the missing required fields message when user clicks on save details button with providing all the required details
    Given I navigate to the add edit products page from dashboard
    And I search for the product manually with UPN number
    And I click on search button
    And I click on save deatils button
    Then I verify the missing required fields message is shown to user

  @addProduct @adminFlows @databaseEntry @sprint0.13 @sprint0.14 @testRunSep25
  Scenario: Verify the invalid quantity message when user clicks on save details button with providing invalid quantity
    Given I navigate to the add edit products page from dashboard
    And I search for the product manually with UPN number
    And I click on search button
    And I will provide catalog number and invalid quantity
    And I click on save deatils button
    Then I will verify the invalid quantity message is shown to user

  @exportSearchResults @adminFlows @databaseEntry @addProduct @sprint0.13 @sprint0.14 @addProduct
  Scenario: Verify the export search results functionality
    Given I navigate to the add edit products page from dashboard
    When I click on advanced search
    Then Page heading should be changed accordingly
    And I will enter the existing product catalog number and click on search for the results
      | CatalogNumber      |
      | automationtestupn1 |
    Then I will verify the Export results button is visible

  @smartScan @sprint0.13 @adminFlows @tools @sprint0.13
  Scenario: Verify the smartscan page Undo functionality and UI elements
    Given I navigate to the admin,smart scan page
    Then I verify the heading of the page
    And I verify the sort button is clickable
    When I capture the scanned string and product id of first product and save it
    And I click on the undo button
    Then I verify the popup message with scanned string , product id with the captured one

  @suggestedManufacturers @adminFlows @alerts @sprint0.13 @testRunSep25
  Scenario: Verify suggested manufacturers are displayed
    Given I navigate to the admin module page, suggested manufacturers
    Then I verify the suggested manufacturers heading is displayed
    Then I will verify the count of the manufacturers displayed
    Then I will verify the add button , reject button and delete buttons are clickable
    When I click on the add button
    Then I will verify the text dispalyed on the add popup ,message and click on cancel button
    When I click on the reject button
    Then I will verify the text dispalyed on the reject popup ,message and click on cancel button
    When I click on the delete button
    Then I will verify the text dispalyed on the delete popup ,message and click on cancel button

  @sprint0.13 @adminFlows @addnewbulletintype @bulletins
  Scenario: Verify user is able to navigate to Bulletin page and add new bulletin type , edit bulletin type and user should be able to search and delete bulletin type
######### Add new bulletin type ##########
    Given I navigate to the bulletin page
    Then I select the tab
      | Tab Name      |
      | Bulletin Type |
    And I enter the bulletin type details and save it
      | Bulletin Type Name |
      | New Bulletin Type  |
    Then I verify the success toast message is displayed
###### Edit New Bulletin type ##########
    And I click on edit icon of newly created bulletin type
    When I edit the bulletin type details and save it
      | Bulletin Type Name    |
      | Edited Bulletin Type1 |
    Then I verify the toaster message
      | Message                             |
      | Bulletin type updated successfully. |
   # Then I verify the toaster message after successfull bulletin type update
####### Delete New Bulletin type ##########
    And I click on delete icon of newly created bulletin type
   # Then I verify the success toast message after bulltin type is deleted
    Then I verify the success toast message is displayed

  @sprint0.13 @adminFlows @addNewBulletinAudience @current1 @bulletins
  Scenario: Verify user is able to navigate and add new bulletin audience, edit and delete bulletin audience
######### Add new bulletin audience ##########
    Given I navigate to the bulletin page
    And I select the tab
      | Tab Name          |
      | Bulletin Audience |
    And I click on add new bulletin audience button
      | Bulletin Audience Name |
      | New Bulletin Audience  |
    Then I verify the success toast message is displayed
######## Edit New Bulletin Audience ##########
    And I click on edit icon of newly created bulletin audience
      | Bulletin Audience Name    |
      | Edited Bulletin Audience1 |
    Then I verify the success toast message is displayed
######## Delete New Bulletin Audience ##########
    And I click on delete icon of newly created bulletin audience
    Then I verify the success toast message is displayed

  @sprint0.13 @adminFlows @addNewBulletin @bulletins
  Scenario: Verify user is able to add new bulletin, edit and delete bulletin
######## Add new bulletin ##########
    Given I navigate to the bulletin page
    And I select the tab
      | Tab Name            |
      | Create New Bulletin |
    And I add a new bulletin
      | Content                         |
      | This is a new bulletin content. |
    Then I verify the success toast message is displayed
######## Edit New Bulletin ##########
    And I select the tab
      | Tab Name |
      | Bulletin |
    And I click on edit icon of newly created bulletin
    Then I verify the success toast message is displayed
######## Delete New Bulletin ##########
    And I select the tab
      | Tab Name |
      | Bulletin |
    And I click on delete icon of newly created bulletin
    Then I verify the success toast message is displayed

  @sprint0.13 @adminFlows @productRecallBulletin @bulletins
  Scenario: Recalled products bulletins
########### Add recalled bulletin ##########################
    Given I navigate to the bulletin page
    And I select the tab
      | Tab Name            |
      | Create New Bulletin |
    Then I select the bulletin type as recalled products and add the product and bulletin details
      | Content                      |
      | This is a recalled bulletin. |
    Then I verify the success toast message is displayed
    And I select the tab
      | Tab Name |
      | Bulletin |
    And I click on delete icon of newly created bulletin
    And I verify the popup header and confirm the popup
      | Header                                         |
      | Are you sure you want to delete this bulletin? |
   #Then I verify the success toast message is displayed

  @sprint0.13 @adminFlows @editMissingProduct @sprint0.15 @missingProduct
  Scenario: verify editing a missing product
    Given I navigate to the suggested manufacturers page
    And I select the tab
      | Tab Name |
      | missing  |
    When I click on edit icon of missing product
    Then I verify the page header of edit missing product page

  @sprint0.13 @adminFlows @deleteMissingProduct @sprint0.15 @missingProduct
  Scenario: verify Delete a missing product
    Given I navigate to the suggested manufacturers page
    And I select the tab
      | Tab Name |
      | missing  |
    And I click on delete icon of the missing product
    And I verify the delete confirmation message on popup

  @sprint0.13 @adminFlows @missingProduct
  Scenario: verify Closing a missing product
    Given I navigate to the suggested manufacturers page
    And I select the tab
      | Tab Name |
      | missing  |
    And I click on delete icon of missing product
    And I verify the delete confirmation message
    #And I click on show closed missing products toggle
    #Then I verify the closed missing product is shown in the list

  @sprint0.14 @adminFlows @bulkProductChecker2.0
  Scenario: Verify the Bulk checker 2.0 page
    Given I navigate to the admin module page, Bulk Checker2.0 page
    Then I verify the heading of the bulk checker2.0 page
    When I check the Has Header row checkbox
    Then I verify the checkbox is checked
    Then I verify the upload button is clickable
    Then I verify when user clicks on upload button without choosing file , an error message needs to be shown
    Then I click on the choose file button and veify the button is enable

  @productAdd @sprint0.14 @adminFlows @bulkImport @testRunSep25
  Scenario: Verify the user is able to download the template
    Given I navigate to the admin module page, Bulk Import page
    Then I verify the heading of the bulk import page
    When I select the option from template Dropdown
      | Template Name |
      | Medications   |
    And I click on the download template button
    Then I verify the template is downloaded

  @hospitalAccountDataEntry @sprint0.14 @adminFlows @newProductAdd @testRunSep25
  Scenario: Verify the new product add button is visible in the hospital account data entry page when user enters a new product number which is not existing in the system
    Given I navigate to the admin module page, Hospital Account Data Entry page
    Then I verify the heading of the hospital account data entry page
    When I will provide the Hospital and Department name
      | Hospital                    | Department |
      | General Hospital - New York | Radiology  |
    And I click on Load Existing products button
    And I Enter New product number which is not existing in the system
    Then I verify the Create new product button is visible

  @hospitalAccountDataEntry @sprint0.14 @adminFlows @existingProductEdit @testRunSep25
  Scenario: Verify the editing existing product details in the hospital account data entry page
    Given I navigate to the admin module page, Hospital Account Data Entry page
    Then I verify the heading of the hospital account data entry page
    When I will provide the Hospital and Department name
      | Hospital                    | Department |
      | General Hospital - New York | Radiology  |
    And I click on Load Existing products button
    And I Enter existing product number which is in the system
      | Existing product catalog |
      | del123                   |
    When I select the first product and edit the details
      | PAR | HospitalOrderID |
      |  40 |              10 |
    Then I verify the toast message after saving the details

  @AddEditDepartment @sprint0.15 @adminFlows
  Scenario: Verify the Add and Edit department page in the admin module
    Given I navigate to the admin module page, Add Edit department page
    Then I verify the heading of the Add Edit department page
    And I verify the Add new department button is and refresh buttons are clickable
    When I click on Add new department button
    Then I verify the popup header
    And I verify all the fileds in the popup are enabled
    When I click on close button of the popup
    Then I verify the search functionality is working by searching with existing department name
      | Department Name |
      | Radiology       |

  @AddEdiHospitalDepartment @sprint0.15 @adminFlows
  Scenario: Verify the Add Edit Hospital department page in the admin module
    Given I navigate to the admin module page, Add Edit Hospital department page
    Then I verify the heading of the Add Edit Hospital department page
    And I verify the Add new hospital button navigates to Side panel with its header
    When I click on the don't see a hospital group link
    Then I should be able to see the text field
    When I click on close button of the side panel
    Then I verify the search functionality is working by searching with existing hospital name
      | Hospital Name               |
      | General Hospital - New York |
    When I click on the edit icon of the first hospital
    Then I verify the side panel of edit hospital is opened by its header

  @addEditIcd @adminFlows @testdemo
  Scenario: Verify the Add and Edit ICD codes page in the admin module
    Given I navigate to the admin module page, Add Edit ICD codes page
    Then I verify the heading of the Add Edit ICD codes page
    And I verify the Add new ICD code button navigates to side panel with its header
    When I close the side panel
    When I click on delete Icon of the first ICD section
    Then I verify the confirmation popup header
    When I click on cancel button of the popup
    When I click on view button
    Then I should be navigated to Blocks page
    When I click on View Button in blocks page
    Then I should be navigated to ICD details page

  @boxMaker @adminFlows @boxMaker @sprint0.15
  Scenario: Verify the Box maker/ Box breaker page in admin module
    Given I navigate to box maker box breaker page from dashboard
    Then I verify the heading of the box maker box breaker page
    When I search for the product with catalog number in box maker page
      | Product existing catalog number |
      | Auto123                         |
    Then I verify the edit action button is clickable and i will click on it
    And I verify the heading of the box maker box breaker popup
    When I enter the UOM and quantity details and click on save button
    Then I verify the success toaster message of UOM and Quantity update

  @manufacturerProductsExport @adminFlows @exportProducts @sprint0.15
  Scenario: Verify the Manufacturer product Export page in admin module
    Given I navigate to Manufacturer Products Export page from dashboard
    Then I verify the heading of the Manufacturer Products Export
    When I select manufacturer and click on export button
    Then the xlsx file should be downloaded successfully

  @Q-De-Duplicator @adminFlows @exportProducts @sprint0.15
  Scenario: Verify the Q-De-Duplicator page in admin module
    Given I navigate to the admin module page, Q-De-Duplicator page
    Then I verify the heading of the Q-De-Duplicator page
    And I verify the banner text of the page
    When I enter the data in the old product field and new product field and click on clear button
    Then I verify the old product and new product fields are cleared
    And I verify the checkboxes provided are clickable
