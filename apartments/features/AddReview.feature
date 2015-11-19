Feature: User should be able to add review to apartments
  
Scenario: Rendering Review
  
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101"
  And I have visited the more about apartment number "101" page 
  And I have clicked on add review
  Then I should see "Add Review
  
Scenario: Adding Review
  
  
Scenario: Add Review while not logged in