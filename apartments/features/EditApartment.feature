Feature: User should be able to edit a apartment's info
  
Scenario: Edit path rendering
    Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101"
  And I have visited the more about apartment number "101" page 
  And I have clicked on edit
  Then I should see "Edit Existing Apartment"
  
Scenario: Authorized user wants to edit apartments info
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101"
  And I have visited the more about apartment number "101" page 
  And I have clicked on edit  
  And I have updated the apartment with number "102"
  And I am on the ApartmentFinder building page  
  And I have visited the Details about "19 E Burlington St" page 
  Then I should see an apartment list entry with number "102"

Scenario: Unauthorized user wants to edit apartments info  
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
  And I have clicked on edit
  Then I should see "Can only edit apartment if you are signed in!"
  