Feature: User should be able to view details about an apartment

Scenario: View Details
Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and city "Iowa City" and management "Apartments Downtown"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on add new apartment
  When I have added an apartment with number "101" and bedrooms "1" and bathrooms "1" and rent "850" and utilities "20"
  And I have visited the more about apartment number "101" page 
  Then I should see "Details about Apartment Number 101"