Feature: User can filter buildings on show page
  
Scenario: Filter By Bedrooms
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent" 
  And I have visited the Details about "305 S Summit St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101" and bedrooms "1" and bathrooms "1" and rent "850" and utilities "20"
  And I have clicked on add new apartment
  When I have added an apartment with number "102" and bedrooms "2" and bathrooms "2" and rent "1000" and utilities "40"
  And I have clicked on add new apartment
  When I have added an apartment with number "131" and bedrooms "3" and bathrooms "2" and rent "1200" and utilities "60"
  And I have filtered bedrooms to "1"
  Then I should see an apartment list entry with number "101" 
  Then I should not see an apartment list entry with number "102" 
  Then I should not see an apartment list entry with number "131" 

Scenario: Filter by bathrooms
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent" 
  And I have visited the Details about "305 S Summit St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101" and bedrooms "1" and bathrooms "1" and rent "850" and utilities "20"
  And I have clicked on add new apartment
  When I have added an apartment with number "102" and bedrooms "2" and bathrooms "2" and rent "1000" and utilities "40"
  And I have clicked on add new apartment
  When I have added an apartment with number "131" and bedrooms "3" and bathrooms "2" and rent "1200" and utilities "60"
  And I have filtered bathrooms to "1"
  Then I should see an apartment list entry with number "102" 
  Then I should see an apartment list entry with number "131" 
  Then I should not see an apartment list entry with number "101" 



  
