Feature: Allow Apartment Finder to add A new building

Scenario:  Add a new building (Declarative)
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello" and confirmation "hello"
  Given I have created a new session with email "clairetest@email.com" and password "hello"
 When I have added a building with address "305 S Summit St" and management "Independent" #still can't find text fields
  And I am on the ApartmentFinder building page  
  Then I should see a building list entry with address "305 S Summit St" and management "Independent"
