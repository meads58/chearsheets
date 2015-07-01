Given(/^I am at the login screen$/) do
  visit '/'
end

When(/^I fill in username with "([^"]*)"$/) do |text_field|
  fill_in('username', with: text_field)
end

When(/^I fill in password with "([^"]*)"$/) do |text_field|
  fill_in('password', with: text_field)
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should see "([^"]*)" message$/) do |message|
  expect(page).to have_content message
  expect(page.current_path).to eq '/'
end

Then(/^be at the "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
