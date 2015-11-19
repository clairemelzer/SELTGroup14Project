Feature: User should be able to delete apartment
  
Scenario: Authorized User wants to delete apartment
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101"
  And I have visited the more about apartment number "101" page 
  And I have clicked on delete
  Then I should not see an apartment list entry with number "101" 
  
Scenario: Unauthorized User wants to delete apartment
  Given I am on the ApartmentFinder building page
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101"
  And I have visited the more about apartment number "101" page 
  And I have clicked on logout
  And I have visited the Details about "19 E Burlington St" page 
  And I have visited the more about apartment number "101" page 
  And I have clicked on delete
  Then I should see "You need to sign in first!"