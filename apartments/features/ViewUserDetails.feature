Feature: User should have a profile with their info

Scenario:  Click on the User Profile link
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello" and confirmation "hello"
  Given I have created a new session with email "clairetest@email.com" and password "hello"
  Given I am on the ApartmentFinder homepage
  #And I click on the User Profile button
  #Then I should see "Profile For"