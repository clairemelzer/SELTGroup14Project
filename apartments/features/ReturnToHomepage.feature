Feature: Allow User to access the homepage from the list of buildings
  
Scenario:  Return to Homepage
  
    Given I am on the ApartmentFinder building page
  And I have visited the homepage
  Then I should see "Welcome To The Apartment Finder"