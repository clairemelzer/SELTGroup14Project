Feature: Allow User to access the homepage from the list of buildings
  
Scenario:  Return to Homepage
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I am on the ApartmentFinder building page
  And I have visited the homepage
  Then I should see "Welcome To The Apartment Finder"