Feature: view the "More about" page for a building

Scenario:  Click on the "More about " link for a building to view additional info
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  Given I have added a building with address "19 E Burlington St" and city "Iowa City" and management "Apartments Downtown" and parking "true" and pets "true"
  And I have visited the Details about "19 E Burlington St" page 
  Then I should see "Details about 19 E Burlington St"
