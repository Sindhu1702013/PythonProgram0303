Feature: Cases page verification with search, filter, delete and archive

  @smoke @regression @24march2025 @encounter
  Scenario: verify Cases list with search functionality & select room, select status filter
    Given I navigated to encounter case page and varified page
    And I selected value from select status dropdown and verified filtered result, selected back to default value
      | status   | verification |
      | In Review | In review    |

  @regression @24march2025 @encounter @archiveEncounter
  Scenario: verify Archive functionality with negative cases like review, upcoming & ongoing status cases
    Given I navigated to encounter case page and varified page
    And I filter cases with given status encounter and Archive it & verify error message
      | status   |
      | In Review |
    And I filter cases with given status encounter and Archive it & verify error message
      | status     |
      | Incomplete |

  @regression @24march2025 @encounter @archiveEncounter
  Scenario: verify Archive functionality with completed status case, restore archived case & verify
    Given I navigated to encounter case page and varified page
    When I filter cases with given status encounter, selected first row and capture the encounter detail to verify
      | status    |
      | Completed |
    And I click on Archive and verify popup along with encounter details and click on Archive Encounter, verify toast message
    And I click on Archive tab, search with recently archived encounter detail and verify result
    Then I select the archived case and click on Restore button, verify popup and confirm
    And I navigate to Cases page, verify restored encounter

  @regression @24march2025 @encounter @deleteEncounter
  Scenario: verify delete functionality with negative cases like Completed & ongoing status cases
    Given I navigated to encounter case page and varified page
    And I filter cases with given status encounter and verify delete button is disabled
      | status    |
      | Completed |

  @regression @24march2025 @encounter @deleteEncounter
  Scenario: verify Delete functionality with in review status case, undo it & verify
    Given I navigated to encounter case page and varified page
    When I filter cases with given status encounter, selected first row and capture the encounter detail to verify
      | status   |
      | In Review |
    And I click on Delete button and verify popup along with encounter details and click on Delete Encounter, verify toast message
    And I click on Delete tab, search with recently deleted encounter detail and verify result
    Then I select the deleted case and click on undo Delete button, verify popup and confirm
    And I navigate to Cases page, verify restored encounter
