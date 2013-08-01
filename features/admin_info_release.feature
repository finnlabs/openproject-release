Feature: Release information
  Background:
    Given I am already admin

  Scenario: is shown on admin info page
    When I go to the admin page
    Then I should see the distribution information on the information page
