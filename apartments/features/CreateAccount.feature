Feature: Allow User to create a new account

Scenario:  Get to create user from the user login page
Given I am on the ApartmentFinder login page
And I have visited the Create Account page
Then I should see "Sign Up"

Scenario: Create Account
 When I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
 Then I should see "Sign up successful! Welcome to Iowa City Apartment Finder"
 
Scenario: Unsuccesful Create Account password not long enough
 When I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello" and confirmation "hello"
 Then I should see "Sign Up"
 
 Scenario: Unsuccesful Create Account email not in right format
 When I have created a new user with name "Claire" and email "clairetest" and password "hello1" and confirmation "hello1"
 Then I should see "Sign Up"
 
 Scenario: Unsuccesful Create Account passwords don't match
 When I have created a new user with name "Claire" and email "clairetest" and password "hello1" and confirmation "hello2"
 Then I should see "Sign Up"
 