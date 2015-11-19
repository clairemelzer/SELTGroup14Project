Feature: Allow Apartment Finder to add A new apartment to a building

Scenario:  Add a new apartment
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101"
  Then I should see an apartment list entry with number "101" 
  
Scenario: Trying to add an apartment while not logged on
#  Given I am on the ApartmentFinder building page
 # And I have visited the Details about "19 E Burlington St" page 
  #And I have clicked on add new apartment
  #Then I should see "Can only add apartment if you are signed in!"
  #doesn't work because i need to be logged on to add a building but i'm testing when i am not logged on