Feature: view the "More about" page for a building

Scenario:  Click on the "More about " link for a building to view additional info

Given I have added a building with address "19 E Burlington St" and managemnt "Apartments Downtown"

When I have visited the Details about "19 E Burlington St" page
Then I should see "Details about 19 E Burlington St"
