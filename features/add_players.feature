Feature: Add new players
  As a very skilled player
  In order to show everyone my skills
  I want to register my username on the system

  Scenario: Add a player
    Given I am on the homepage
    When I fill in "username" with "Gus"
    And I press "Add me!"
    Then I should see "Hi Gus! You are now in the system."
