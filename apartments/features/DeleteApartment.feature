Feature: User should be able to delete apartment
  
Background: signed in and added building and apartment
  Given I am on the ApartmentFinder building page
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and city "Iowa City" and management "Apartments Downtown" and parking "true" and pets "true"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on "Add Apartment for Building"
  When I have added an apartment with number "101" and bedrooms "1" and bathrooms "1" and rent "850" and utilities "20" and laundry "true" and air "true" and balcony "true"
  And I have visited the more about apartment number "101" page 
  
Scenario: Authorized User wants to delete apartment
  And I have clicked on "Delete"
  Then I should not see an apartment list entry with number "101" 
  
Scenario: Unauthorized User wants to delete apartment
  And I have clicked on "Logout"
  And I have visited the Details about "19 E Burlington St" page 
  And I have visited the more about apartment number "101" page 
  And I have clicked on "Delete"
  Then I should see "Can only delete apartment if you are signed in!"