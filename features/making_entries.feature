Feature: Making Entries

  Scenario: Making a new entry
    When I am on the new entry page
    And I enter a comment
    And hit submit
    Then I am on the index page
    And I see my entry
