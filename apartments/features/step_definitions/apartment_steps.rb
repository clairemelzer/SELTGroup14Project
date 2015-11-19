  When /^I have clicked on add new apartment$/ do 
   click_on "Add Apartment for Building"
 end
 
   When /^I have clicked on add review$/ do 
   click_on "Add review for this apartment"
 end
 
    When /^I have clicked on edit$/ do 
   click_on "Edit This Apartment"
 end
  
 When /^I have added an apartment with number "(.*?)"$/ do |number|
  fill_in 'Apartment Number', :with => number
  click_button 'Add Apartment'
 end
 
  When /^I have updated the apartment with number "(.*?)"$/ do |number|
  fill_in 'Apartment Number', :with => number
  click_button 'Update Apartment'
 end

 Then /^I should see an apartment list entry with number "(.*?)"$/ do |number| 
   result=false
   all("tr").each do |tr|
     if tr.has_content?(number)
       result = true
       break
     end
   end  
  expect(result).to be_truthy
 end
 
  Then /^I should not see an apartment list entry with number "(.*?)"$/ do |number| 
   result=false
   all("tr").each do |tr|
     if tr.has_content?(number)
       result = false
       break
     end
   end  
  expect(result).to be_falsey
 end
 
  When /^I have visited the more about apartment number "(.*?)" page$/ do |number|
   click_on "More about apartment number #{number}"
 end
 
  When /^I have added a review with comment "(.*?)"$/ do |comment|
  fill_in 'Comments', :with => comment
  click_button 'Add Review'
 end
 
  Then /^I should see a review list entry with comment "(.*?)"$/ do |comment| 
   result=false
   all("tr").each do |tr|
     if tr.has_content?(comment)
       result = true
       break
     end
   end  
  expect(result).to be_truthy
 end