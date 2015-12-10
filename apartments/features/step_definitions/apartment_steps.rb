  When /^I have clicked on "(.*?)"$/ do |click|
   click_on click
 end

  
 When /^I have added an apartment with number "(.*?)" and bedrooms "(.*?)" and bathrooms "(.*?)" and rent "(.*?)" and utilities "(.*?)" and laundry "(.*?)" and air "(.*?)" and balcony "(.*?)"$/ do |number, bedrooms, bathrooms, rent, utilities, laundry, air, balcony|
  fill_in 'Apartment Number', :with => number
  fill_in "Bedrooms", :with => bedrooms
  fill_in "Bathrooms", :with => bathrooms
  fill_in "Rent", :with => rent
  fill_in "Average Monthly Utilities", :with => utilities
  if laundry == "true"
   check 'Laundry In Unit?'
  end
  if air == "true"
   check 'Central Air'
  end
  if balcony == "true"
   check 'Balcony'
  end
  
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
 
 And /^I have filtered "(.*?)" to "(.*?)"$/ do |search, param|
  search = param
  click_on "Filter"
 end
 
  And /^I have filtered laundry$/ do
  filterlaundry = true
  click_on "Filter"
 end
 
  And /^I have filtered air$/ do
   filterair = true
   click_on "Filter"
  end
 
  And /^I have filtered balcony$/ do
   filterbalcony = true
   click_on "Filter"
  end
 