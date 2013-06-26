Feature: Release information
  Background:
    Given I am logged in as "admin"

  Scenario: is shown on admin info page
    When I go to the admin page
    And I click on "Information"
    Then I should see "Distribution" within "#content"
    And I should see "Version" within "#content"
    And I should see "Last update" within "#content"
