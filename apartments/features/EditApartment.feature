Feature: User should be able to edit a apartment's info
  
Background: Signed in and added building and apartment
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and city "Iowa City" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101" and bedrooms "1" and bathrooms "1" and rent "850" and utilities "20"
  And I have visited the more about apartment number "101" page 
  
Scenario: Edit path rendering
  And I have clicked on edit
  Then I should see "Edit Existing Apartment"
  
Scenario: Authorized user wants to edit apartments info
  And I have clicked on edit  
  And I have updated the apartment with number "102" and bedrooms "1" and bathrooms "1" and rent "850" and utilities "20"
  And I am on the ApartmentFinder building page  
  And I have visited the Details about "19 E Burlington St" page 
  Then I should see an apartment list entry with number "102"

Scenario: Unauthorized user wants to edit apartments info  
  And I have clicked on logout
  And I have visited the Details about "19 E Burlington St" page 
  And I have visited the more about apartment number "101" page 
  And I have clicked on edit
  Then I should see "Can only edit apartment if you are signed in!"
  