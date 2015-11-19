Feature: User should be able to edit a building's info
  
Scenario: Render edit form
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on edit building
  Then I should see "Edit Existing Building"
  
Scenario: Authorized user wants to edit buildings info
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
    And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on edit building
  And I have updated the building with address "305 S Summit St" and management "Independent" 
  And I am on the ApartmentFinder building page  
  Then I should see a building list entry with address "305 S Summit St" and management "Independent"

Scenario: Unauthorized user wants to edit buildings info  
    Given I am on the ApartmentFinder building page
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have clicked on logout
  And I am on the ApartmentFinder building page 
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on edit building
  Then I should see "Can only edit building if you are signed in!"
