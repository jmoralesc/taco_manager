require 'faker'

FactoryGirl.define do
  factory :menu_option do
    name { Faker::Company.name }
    price { Faker::Number.number(2) }
  end
end