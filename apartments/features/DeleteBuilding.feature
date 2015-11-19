Feature: User should be able to delete building
  
Scenario: Authorized User wants to delete building
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on delete
  Then I should not see a building list entry with address "19 E Burlington St" and management "Apartments Downtown" 
  
Scenario: Unauthorized User wants to delete building
  Given I am on the ApartmentFinder building page
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have clicked on logout
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on delete
  Then I should see "Can only delete building if you are signed in!"