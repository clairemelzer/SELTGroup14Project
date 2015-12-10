Feature: User can Search for buildings from homepage
  
Scenario: Search by Address
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent"
  When I have added a building with address "19 E Burlington" and city "Iowa City" and management "Apts Downtown"
  When I have added a building with address "319 E Court St" and city "Iowa City" and management "Hawkeye"
  And I have visited the homepage
  And I have searched for address "305 S Summit St"
  Then I should see a building list entry with address "305 S Summit St" and management "Independent"
  Then I should not see a building list entry with address "19 E Burlington" and management "Apt Downtown"
  Then I should not see a building list entry with address "319 E Court St" and management "Hawkeye" 

Scenario: Search by Company
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent" 
  When I have added a building with address "19 E Burlington" and city "Iowa City" and management "Apts Downtown"
  When I have added a building with address "319 E Court St" and city "Iowa City" and management "Hawkeye"
  And I have visited the homepage
  And I have searched for company "Apts Downtown"
  Then I should see a building list entry with address "19 E Burlington" and management "Apts Downtown"
  Then I should not see a building list entry with address "305 S Summit St" and management "Independent"
  Then I should not see a building list entry with address "319 E Court St" and management "Hawkeye"

Scenario: Search by City
  Given I have created a new user with name "Claire" and email "clairetest@email.com" and password "hello1" and confirmation "hello1"
  Given I have created a new session with email "clairetest@email.com" and password "hello1"
  When I have added a building with address "305 S Summit St" and city "Iowa City" and management "Independent" 
  When I have added a building with address "19 E Burlington" and city "Iowa City" and management "Apts Downtown"
  When I have added a building with address "319 E Court St" and city "Iowa City" and management "Hawkeye"
  And I have visited the homepage
  And I have searched for city "Iowa City"
  Then I should see a building list entry with address "19 E Burlington" and management "Apts Downtown" 
  Then I should not see a building list entry with address "305 S Summit St" and management "Independent" 
  Then I should not see a building list entry with address "319 E Court St" and management "Hawkeye"


  
