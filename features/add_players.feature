Feature: Add new players
  As a very skilled player
  In order to show everyone my skills
  I want to register my username on the system

  Scenario: Add a player
    Given I am on the homepage
    When I fill in "username-register" with "Gus"
    And I press "submit-register" within "registytfkuyfkerrgved"
    Then I should see "Hi Gus! You are now in the system."
