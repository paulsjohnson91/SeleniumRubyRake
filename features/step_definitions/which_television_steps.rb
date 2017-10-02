require "selenium-webdriver"

Given(/^The television review page has been launched$/) do
  @driver = Selenium::WebDriver.for :chrome
  @driver.navigate.to "http://www.which.co.uk/reviews/televisions"
end

And(/^I have set the filter to 47-50 inches$/) do
  #element = @driver.find_element(css: 'section._1Locb:nth-child(2) > ul:nth-child(2) > li:nth-child(4) > label:nth-child(1) > div:nth-child(2)')
  element = @driver.find_element(css: 'section._1Locb:nth-child(2) > ul:nth-child(2) > li:nth-child(4)')
  element.click
end

Then(/^only tvs with a size between 47 and 50 inches are displayed$/) do
  acceptedValues = ["47\"","48\"","49\"","50\""]
  sleep(2)
  elements = @driver.find_elements(class: '_1ULbH')
  elements.each do |x|
    if not acceptedValues.include? x.text
      raise "Error, was not expecting a tv of size " + x.text + " in the filtered results"
    end
  end
  currenturl =  @driver.current_url
  expected = "http://www.which.co.uk/reviews/televisions?search[range][screen_size][Screen_size][]=47-51&sortby=testing_date_desc&page=1"
  if not currenturl == expected
    raise "Error, url was supposted to be: \nhttp://www.which.co.uk/reviews/televisions?search[range][screen_size][Screen_size][]=47-51&sortby=testing_date_desc&page=1" + "\nbut came back as:\n" + @driver.current_url
  end
end

And(/^I open the first tv in the list$/) do
  @driver.find_element(css: 'li._3M9TC:nth-child(2) > div:nth-child(1) > a:nth-child(1) > div:nth-child(3) > p:nth-child(1)').click
end

Then(/^I can see the price of the tv$/) do
  pricetext = @driver.find_element(class: 'SWBi6').text
  if not pricetext[0] == '£'
    raise "Error, price for tv not found"
  end
end

And(/^I can click on the retailer link$/) do
  @driver.find_element(class: '_3ac5f').click
end

Then(/^I can see the tv price comparisons$/) do
  if not @driver.find_element(id: 'retailers').displayed?
    raise "Error retail prices for selected tv not found"
  end
end

And(/^I can set the minimum price to £1000$/) do
  @driver.find_element(class:'_3e5kg').click
  @driver.find_element(css: '#from > option:nth-child(11)').click
end

Then(/^all the tvs displayed cost more than £1000$/) do
  sleep(2)
  elements = @driver.find_elements(class: '_3iJwn')
  elements.each do |x|
    if x.text.length < 9
      raise "Error, price " + x.text.length + " is less than £1000"
    end
  end
end

After do |scenario|
  if scenario.failed?
    #take screenshot
  end
  @driver.quit
end