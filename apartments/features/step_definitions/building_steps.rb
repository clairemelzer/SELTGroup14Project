

Given /^I am on the ApartmentFinder building page$/ do
  visit buildings_path
 end
 
Given /^I am on the ApartmentFinder homepage$/ do
  visit homepage_path
 end

 When /^I have added a building with address "(.*?)" and city "(.*?)" and management "(.*?)"$/ do |address, city,  management|
  visit new_building_path
  fill_in 'Address', :with => address
  fill_in 'Management Company', :with => management
  fill_in 'City', :with => city
  click_button 'Add Building'
 end
 
  When /^I have updated the building with address "(.*?)" and management "(.*?)"$/ do |address, management|
  fill_in 'Address', :with => address
  fill_in 'Management Company', :with => management
  click_button 'Update Building'
 end

 Then /^I should see a building list entry with address "(.*?)" and management "(.*?)"$/ do |address, management| 
   result=false
   all("tr").each do |tr|
     if tr.has_content?(address) && tr.has_content?(management)
       result = true
       break
     end
   end  
  expect(result).to be_truthy
 end
 
 Then /^I should not see a building list entry with address "(.*?)" and management "(.*?)"$/ do |address, management| 
   result=false
   all("tr").each do |tr|
     if tr.has_content?(address) && tr.has_content?(management)
       result = false
       break
     end
   end  
  expect(result).to be_falsey
 end 
 
 When /^I have visited the "(.*?)" page$/ do |address|
   visit homepage_path
   click_on "View All Buildings"
 end
 
  When /^I have clicked on add new building$/ do
   visit buildings_path
   click_on "Add new Building"
 end
 
   When /^I have clicked on delete$/ do
   click_on "Delete"
 end
 
    When /^I have clicked on logout$/ do
   click_on "Logout"
 end
 
    When /^I have clicked on edit building$/ do
   click_on "Edit This Building"
 end
 
  When /^I have visited the homepage$/ do 
   visit buildings_path
   click_on "Return to Homepage"
 end

 When /^I have visited the Details about "(.*?)" page$/ do |address|
   visit buildings_path
   click_on "More about #{address}"
 end
 
 And /I have searched for "(.*?)" "(.*?)"$/ do |search, param|
  fill_in search, :with => param
  click_on "Search"
 end
 
 And /I have searched for company "(.*?)"$/ do |company|
   searchcompany = company
   click_on "Search"
 end
 
 And /I have searched for city "(.*?)"$/ do |city|
   searchcity = city
   click_on "Search"
 end

 Then /^(?:|I )should see "([^"]*)"$/ do |text|
    expect(page).to have_content(text)
 end




