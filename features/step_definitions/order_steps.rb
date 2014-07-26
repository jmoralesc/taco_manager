
When(/^I  select a food place$/) do
  select FoodPlace.last.name, from: "order_food_place_id"
end

Given(/^I have orders$/) do
  Order.create!({
  	 user_id: User.last.id,
  	 food_place_id: FoodPlace.last.id,
  	})
end

Given(/^I have orders with menu line items$/) do
  Order.create!({
    user_id: User.last.id,
  	food_place_id: FoodPlace.last.id,
  })
  MenuLineItem.create!({
  	 menu_option_id: MenuOption.last.id,
     user_id: User.last.id,
     quantiy: "2"
  	})
   Order.last.menu_line_items << MenuLineItem.last
end

Given(/^I edit an order$/) do
   visit path_to('edit order')
end

Given(/^I have menu options$/) do
  MenuOption.create!({
  	name: "Taquitos",
    price: "23",
    food_place_id: FoodPlace.last.id
  	})
end

Given(/^I follow one order's details$/) do
   page.first(:link,'details').click
end

When(/^I check payed$/) do
  page.first(:css,'.payed').set(true)
end


Then(/^the order should be updated$/) do
  MenuLineItem.create!({
  	 menu_option_id: MenuOption.last.id,
     user_id: User.last.id,
     quantiy: "2"
  	})
   Order.last.menu_line_items << MenuLineItem.last
end

Then(/^I should see details of that order$/) do
  if page.respond_to? :should
    page.should have_content(Order.last.food_place.name)
  else
    assert page.has_content?(Order.last.food_place.name)
  end  
end

Then(/^I should see the line item as paid$/) do
  if page.respond_to? :should
    page.should have_css('.success')
  else
    assert page.has_css?('.success')
  end  
end

Then(/^I should have ([0-9]+) order$/) do |count|
  Order.count.should == count.to_i
end

Then(/^I should see a new line item in the order$/) do
  if page.respond_to? :should
    page.should have_content(Order.last.menu_line_items.last.user.username)
  else
    assert page.has_content?(Order.last.menu_line_items.last.user.username)
  end  
end

