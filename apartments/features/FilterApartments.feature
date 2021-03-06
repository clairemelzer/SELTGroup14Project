Feature: User can filter buildings on show page
  
Background: Signed in and movies and apartments added
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent" and parking "true" and pets "true"
  And I have visited the Details about "305 S Summit St" page 
  And I have clicked on "Add Apartment for Building"
  When I have added an apartment with number "101" and bedrooms "1" and bathrooms "1" and rent "850" and utilities "20" and laundry "false" and air "false" and balcony "false"
  And I have clicked on "Add Apartment for Building"
  When I have added an apartment with number "102" and bedrooms "2" and bathrooms "2" and rent "1000" and utilities "40" and laundry "true" and air "true" and balcony "true"
  And I have clicked on "Add Apartment for Building"
  When I have added an apartment with number "131" and bedrooms "3" and bathrooms "2" and rent "1200" and utilities "60" and laundry "true" and air "true" and balcony "true"
  
Scenario: Filter By Bedrooms
  And I have filtered "Bedrooms" to "1"
  Then I should see an apartment list entry with number "101" 
  Then I should not see an apartment list entry with number "102" 
  Then I should not see an apartment list entry with number "131" 

Scenario: Filter by bathrooms
  And I have filtered "Bathrooms" to "1"
  Then I should see an apartment list entry with number "102" 
  Then I should see an apartment list entry with number "131" 
  Then I should not see an apartment list entry with number "101" 
  
Scenario: Filter by laundry
 And I have filtered laundry
  Then I should see an apartment list entry with number "102" 
  Then I should see an apartment list entry with number "131" 
  Then I should not see an apartment list entry with number "101" 
 
Scenario: Filter by air
  And I have filtered air
  Then I should see an apartment list entry with number "102" 
  Then I should see an apartment list entry with number "131" 
  Then I should not see an apartment list entry with number "101" 

Scenario: Filter by balcony
 And I have filtered balcony
 Then I should see an apartment list entry with number "102" 
 Then I should see an apartment list entry with number "131" 
 Then I should not see an apartment list entry with number "101" 

  
