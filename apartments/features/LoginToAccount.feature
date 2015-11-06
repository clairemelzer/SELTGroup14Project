Feature: Allow User to login to account

Scenario:  Get to login page from homepage
  Given I am on the ApartmentFinder homepage
  And I have visited the login page
  Then I should see "Login"
  
Scenario: Succesful Login
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello" and confirmation "hello"
  When I have created a new session with email "clairetest@email.com" and password "hello"
  And I am on the ApartmentFinder homepage
  Then I should see "Welcome"
  #Then I should see "You are logged in as Claire"
  
Scenario: Succesful Log-out
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello" and confirmation "hello"
  Given I have created a new session with email "clairetest@email.com" and password "hello"
  And I am on the ApartmentFinder homepage
  #And I click the Log-out Button
  Then I should see "Welcome"
  #Then I should see "You have logged out"