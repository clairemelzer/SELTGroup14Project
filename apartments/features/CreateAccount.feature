Feature: Allow User to create a new account

Scenario:  Get to create user user from the user login page
Given I am on the ApartmentFinder login page
And I have visited the Create Account page
Then I should see "Sign Up"

Scenario: Create Account
 When I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello" and confirmation "hello"
 And I am on the ApartmentFinder login page
 Then I should see "Login"
 #Then I should see "You are logged in as clairetest@email.com User name: Claire"