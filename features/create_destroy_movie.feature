Feature: add a new movie to the list
 
  As a movie fan
  So that I can comment a new film
  I want to add a new movie to the database and delete duplicates

Background: i am on the homepage
  Given the following movies exist:
  | title                   | rating | release_date |
  | Alien                   | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  And I am on the RottenPotatoes home page

Scenario: add a new movie
  When I follow "Add new movie"
  And  I fill in "Title" with "Alien"
  And  I select "R" from "Rating"
  And  I press "Save Changes"
  Then I should see "Alien"

Scenario: add a new movie
  When I follow "More about Alien"
  And  I press "Delete"
  Then the "Movie Title" field should not contain "Alien"
