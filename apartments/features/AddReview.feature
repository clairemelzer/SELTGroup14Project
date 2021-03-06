Feature: User should be able to add review to apartments
 
Background: Signed in and added building and apartment
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and city "Iowa City" and management "Apartments Downtown" and parking "true" and pets "true"
  And I have visited the Details about "19 E Burlington St" page 
  And I have clicked on "Add Apartment for Building"
  When I have added an apartment with number "101" and bedrooms "1" and bathrooms "1" and rent "850" and utilities "20" and laundry "true" and air "true" and balcony "true"
  And I have visited the more about apartment number "101" page 
  
Scenario: Rendering add Review page
  And I have clicked on "Add review for this apartment"
  Then I should see "Add a new Review"
  
Scenario: Adding Review
  And I have clicked on "Add review for this apartment"
  And I have added a review with comment "Great Place" 
  Then I should see a review list entry with comment "Great Place"
  
  
Scenario: Add Review while not logged in
  And I have clicked on "Logout"
  And I have visited the Details about "19 E Burlington St" page 
  And I have visited the more about apartment number "101" page 
  And I have clicked on "Add review for this apartment"
  Then I should see "Can only add review if you are signed in!"