@web @television
Feature: Television
  I want to be able to view information on televisions

  @view @SelectTv @Filters
  Scenario: I can filter tv search to between 47 to 50 inches
    Given The television review page has been launched
    And I have set the filter to 47-50 inches
    Then only tvs with a size between 47 and 50 inches are displayed

  @view @tvprice
  Scenario: Selecting the first tv to get the price
    Given The television review page has been launched
    And I open the first tv in the list
    Then I can see the price of the tv
    And I can click on the retailer link
    Then I can see the tv price comparisons

  @view @Filters @tvprices
  Scenario: I can filter tv search to over £1000
    Given The television review page has been launched
    And I can set the minimum price to £1000
    Then all the tvs displayed cost more than £1000