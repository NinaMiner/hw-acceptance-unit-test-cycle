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

Then(/I should see "([^"]*)" before"([^"]*)"$/) do |arg1, arg2|
  /#{arg1}.*#{arg2}/ =~ page.body
end

When /I follow ("Find Movies With Same Director")$/ do |link|
  click_link "Find Movies With Same Director"
  expect(response.to render_template("search"))
end

Then /I should be on ("the Same Director page") for "([^"]*)"$/ do |search|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(search)
  else
    assert_equal path_to(search), current_path
  end
end

When /I destroy "([^"]*)"/ do |destroy|
  click_link "Destoy"
end