

Given /^I am on the ApartmentFinder building page$/ do
  visit buildings_path
 end
 
Given /^I am on the ApartmentFinder homepage$/ do
  visit homepage_path
 end

 When /^I have added a building with address "(.*?)" and management "(.*?)"$/ do |address, management|
  visit new_building_path
  fill_in 'Address', :with => address
  fill_in 'Management Company', :with => management
  click_button 'Add Building'
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
 

 When /^I have visited the "(.*?)" page$/ do |address|
   visit homepage_path
   click_on "View All Buildings"
 end
 
  When /^I have visited the homepage$/ do 
   visit buildings_path
   click_on "Return to Homepage"
 end

 When /^I have visited the Details about "(.*?)" page$/ do |address|
   visit buildings_path
   click_on "More about #{address}"
 end

 Then /^(?:|I )should see "([^"]*)"$/ do |text|
    expect(page).to have_content(text)
 end



