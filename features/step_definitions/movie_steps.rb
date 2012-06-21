# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
  Movie.create!(:title=>movie['title'],:rating=>movie['rating'],:release_date=>movie['release_date'],:director=>movie['director'])
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  page.body.index(e1).should < (page.body.index(e2))
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/,\s*/).each do |rat|
    if uncheck then
      uncheck("ratings[#{rat}]")
    else
      check("ratings[#{rat}]")
    end
  end
end

Then /I should see all of the movies/ do
  rows = Movie.count
  rows.should == (page.all('tr').count - 1)
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  page.find('tr',:text => movie).has_content?(director).should == true
end
