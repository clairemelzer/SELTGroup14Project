Feature: User should be able to edit a building's info
  
Background: signed in and added building
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and city "Iowa City" and management "Apartments Downtown"
  
Scenario: Render edit form
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on "Edit This Building"
  Then I should see "Edit Existing Building"
  
Scenario: Authorized user wants to edit buildings info
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on "Edit This Building"
  And I have updated the building with address "30 S Summit St" and management "Independent" 
  And I am on the ApartmentFinder building page  
  Then I should see a building list entry with address "30 S Summit St" and management "Independent"

Scenario: Unauthorized user wants to edit buildings info  
  And I have clicked on "Logout"
  And I am on the ApartmentFinder building page 
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on "Edit This Building"
  Then I should see "Can only edit building if you are signed in!"
