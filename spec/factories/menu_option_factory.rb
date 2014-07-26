require 'faker'

FactoryGirl.define do
  factory :menu_option do
    name { Faker::Company.name }
    price { Faker::Number.number(2) }
    food_place_id {FoodPlace.last.id}
  end
end