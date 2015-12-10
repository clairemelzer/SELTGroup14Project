Feature: Allow Apartment Finder to add A new building

Scenario:  Add a new building (Declarative)
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
 When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent" 
  And I am on the ApartmentFinder building page  
  Then I should see a building list entry with address "305 S Summit St" and management "Independent"
  
Scenario: Trying to add a building while not logged on
  Given I am on the ApartmentFinder building page  
  And I have clicked on add new building
  Then I should see "Can only add building if you are signed in!"
  
Scenario:  Add a new building (Declarative) without the right parameters
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
 When I have added a building with address "" and city "" and management "" 
  Then I should see "Address can't be blank"

Scenario:  Add a new building with same address
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent" 
  When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent" 
  Then I should see "Address has already been taken"