#restate the movie condition
Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end
#use the cucumber code hint for the first error case
Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie, director|
  #pending # Write code here that turns the phrase above into concrete actions
  expect(Movie.find_by_title(movie).director).to eq director
end
