Feature: Allow Apartment Finder to add A new apartment to a building

Background: I am signed in 
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and city "Iowa City" and management "Apartments Downtown"

Scenario:  Add a new apartment
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101" and bedrooms "1" and bathrooms "1" and rent "850" and utilities "20"
  Then I should see an apartment list entry with number "101" 
  
Scenario: Trying to add an apartment while not logged on
  And I have clicked on logout
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  Then I should see "You need to sign in first!"
  
Scenario: Trying to add an apartment with out right parameters
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "" and bedrooms "" and bathrooms "" and rent "" and utilities ""
  Then I should see "Bedrooms can't be blank"
  
Scenario: Trying to add an apartment with out using numbers 
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "h" and bedrooms "h" and bathrooms "h" and rent "h" and utilities "h"
  Then I should see ""