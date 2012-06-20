Feature: add a new movie to the list
 
  As a movie fan
  So that I can comment a new film
  I want to add a new movie to the database and delete duplicates

Background: i am on the homepage
  Given I am on the RottenPotatoes home page
  And I check the following ratings: G, PG, PG-13, R, NC-17
  And I press "Refresh"

Scenario: add a new movie
  When I follow "Add new movie"
  And  I fill in "Title" with "Alien"
  And  I select "R" from "Rating"
  And  I press "Save Changes"
  Then I should see "Alien"

Scenario: add a new movie
  Given I follow "Add new movie" 
  And  I fill in "Title" with "South Park"
  And  I press "Save Changes"
  When I follow "More about South Park"
  And  I press "Delete"
  Then I should not see "South Park"
