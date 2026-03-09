Feature: Qsight dashboard

  @smoke @regression @29august2025 @dashboard @current @dashboard
  Scenario: Verify all the headers in dashboard page
    Given I navigate to qsight dashboard page
    Then I verify all the headers in dashboard page
      | Header Name      |
      | Quick Actions    |
      | Activity Monitor |
      | Alerts           |

  @smoke @regression @29august2025 @dashboard @current @dashboard
  Scenario:  Verify all the headers in dashboard page
    Given I navigate to qsight dashboard page
    Then I click on the quick button
      | Quick Action Name |
      | Add               |
    Then I verify the quick action is triggered
      | Page Header      |
      | Add To Inventory |
    Given I navigate to qsight dashboard page internally
    Then I click on the remove button
      | Quick Action Name |
      | Remove            |
    Then I verify the quick action for remove button is triggered
      | Page Header           |
      | Remove from Inventory |
    Given I navigate to qsight dashboard page internally
    When I click on the order button
      | Quick Action Name |
      | Order             |
    Then I verify the quick action for order is triggered
      | Page Header                  |
      | View, Edit and Search Orders |
    Given I navigate to qsight dashboard page internally
    When I click on the product search button
      | Quick Action Name |
      | Search            |
    Then I verify the quick action for search is triggered
      | Page Header    |
      | Product Search |

  @dashboard @alerts @sprint0.13 @dashboard
  Scenario: Verify the Alerts buttons functionality
    Given I navigate to qsight dashboard page
    When I click on the bulletins review button
    Then I should be navigated to the bulletins screen and the page title should be verified
    When I click on Near expired review button
    Then I should be navigated to the near expired screen and the page title should be verified
    When I click on the out of stock review button
    Then I should be navigated to the out of stock screen and the page title should be verified
