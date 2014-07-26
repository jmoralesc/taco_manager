
Given(/^I have food places$/) do
  FoodPlace.create!({
  	 name: "fondita",
  	 phone_number: "12345678",
  	 time: "12",
  	 address1: "Jesus Alcaraz #597",
  	 address2: "El Porvenir",
  	 state: "Colima",
  	 city: "Colima",
     user_id: User.last.id
  	})
end

Given(/^I have no food places$/) do
  FoodPlace.delete_all
end

Given(/^I follow one food place$/) do

  page.first(:css,'.food-place').click
end

Then(/^I should see details of that food place$/) do
  if page.respond_to? :should
    page.should have_content(FoodPlace.last.name)
    page.should have_content(FoodPlace.last.phone_number)
    page.should have_content(FoodPlace.last.address1)
  else
    assert page.has_content?(FoodPlace.last.name)
    assert page.has_content?(FoodPlace.last.phone_number)
    assert page.has_content?(FoodPlace.last.address1)
  end  
end

When(/^I edit that food place$/) do
  visit(edit_food_place_path(FoodPlace.last.id) )
end

Given(/^I am a valid user$/) do
  User.create!({
     email: "test@example.com",
     username: "test",
     password: "12345678",
     password_confirmation: "12345678"
    })
end

Given(/^I am loged in$/) do
  step "I am a valid user"
  fill_in "user_login", with: "test"
  fill_in "user_password", with: "12345678"
  click_button "sign_in"

 end
  
When(/^I rate that food place$/) do
  page.first(:css,'.eval').click
end

When(/^I select "(.*?)"$/) do |style|
  select style, from: 'style_display'
 
end

Then(/^I should have ([0-9]+) food place$/) do |count|
  FoodPlace.count.should == count.to_i
end

Then(/^I should see food places displayed in "(.*?)"$/) do |style|
   if page.respond_to? :should
    page.should have_css('.' +  style)
  else
    assert page.has_css?('.' + style)
  end  
end

