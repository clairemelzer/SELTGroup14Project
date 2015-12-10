Feature: User can Search for buildings from homepage
  
Background: Signed in and buildings added
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent" and parking "true" and pets "true"
  When I have added a building with address "19 E Burlington" and city "Iowa City" and management "Apts Downtown" and parking "false" and pets "true"
  When I have added a building with address "319 E Court St" and city "Iowa City" and management "Hawkeye" and parking "true" and pets "false"
  And I have visited the homepage

Scenario: Search by Address
  And I have searched for "Address" "305 S Summit St"
  Then I should see a building list entry with address "305 S Summit St" and management "Independent" 
  Then I should not see a building list entry with address "19 E Burlington" and management "Apt Downtown"
  Then I should not see a building list entry with address "319 E Court St" and management "Hawkeye" 

Scenario: Search by Company
  And I have searched for company "Apts Downtown"
  Then I should see a building list entry with address "19 E Burlington" and management "Apts Downtown"
  Then I should not see a building list entry with address "305 S Summit St" and management "Independent"
  Then I should not see a building list entry with address "319 E Court St" and management "Hawkeye"

Scenario: Search by City
  And I have searched for city "Iowa City"
  Then I should see a building list entry with address "19 E Burlington" and management "Apts Downtown" 
  Then I should not see a building list entry with address "305 S Summit St" and management "Independent" 
  Then I should not see a building list entry with address "319 E Court St" and management "Hawkeye"

Scenario: Search by parking
  And I have searched for parking available
  Then I should see a building list entry with address "19 E Burlington" and management "Apts Downtown" 
  Then I should not see a building list entry with address "305 S Summit St" and management "Independent" 
  Then I should see a building list entry with address "319 E Court St" and management "Hawkeye"
  
Scenario: Search by pets
  And I have searched for parking available
  Then I should see a building list entry with address "19 E Burlington" and management "Apts Downtown" 
  Then I should see a building list entry with address "305 S Summit St" and management "Independent" 
  Then I should not see a building list entry with address "319 E Court St" and management "Hawkeye"

  
