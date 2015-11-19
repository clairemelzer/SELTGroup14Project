  When /^I have clicked on add new apartment$/ do 
   click_on "Add Apartment for Building"
 end
  
 When /^I have added an apartment with number "(.*?)"$/ do |number|
  fill_in 'Apartment Number', :with => number
  click_button 'Add Apartment'
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
 
  When /^I have visited the more about apartment number "(.*?)" page$/ do |number|
   click_on "More about apartment number #{number}"
 end