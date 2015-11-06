Given /^I am on the ApartmentFinder login page$/ do
  visit new_session_path
 end
 
 When /^I have visited the Create Account page$/ do
   visit new_user_path

 end
 
  When /^I have visited the login page$/ do
   visit new_session_path

 end
 
 When /^I have created a new user with name "(.*?)" and email "(.*?)" and password "(.*?)" and confirmation "(.*?)"$/ do |name, email, password, confirmation|
   visit new_user_path
  fill_in 'Name', :with => name
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  fill_in 'Confirm Password', :with => confirmation
  click_button 'Create User'
 end

When /^I have created a new session with email "(.*?)" and password "(.*?)"$/ do |email, password|
 visit new_session_path
 fill_in 'E-Mail', :with => email
 fill_in 'Password', :with => password
 click_button "Login to my account"
end

When /^I click the Log-out Button$/ do
 click_button "Log Out"
end