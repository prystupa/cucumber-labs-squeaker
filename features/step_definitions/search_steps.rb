When /^I enter "(.*?)" in the search field$/ do |query|
  visit('/search')
  fill_in('query', :with => query)
end

When /^I search for "(.*?)"$/ do |query|
  visit('/search')
  fill_in('query', :with => query)
  click_button('Search')
end

Then /^the results should be:$/ do |expected_results|
  find('ol.results li')
  results = [['content']] + page.all('ol.results li').map do | li |
    [li.text]
  end
  expected_results.diff!(results)
end