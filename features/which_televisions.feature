@web @television
Feature: Television
  I want to be able to view information on televisions

  @view @SelectTv
  Scenario: Selecting a new tv between 47 to 50 inches to read the review
    Given The television review page has been launched
    And I have set the filter to 47-50 inches
    Then only tvs with a size between 47 and 50 inches are displayed

  @view @SelectTv
  Scenario: Selecting the first tv to read the review
    Given The television review page has been launched
    And I open the first tv in the list