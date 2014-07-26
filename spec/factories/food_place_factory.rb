require 'faker'

FactoryGirl.define do
  factory :food_place do
    name { Faker::Company.name }
    phone_number { Faker::PhoneNumber.phone_number }
    time { Faker::Number.number(2) }
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    state { Faker::Address.city }
    city { Faker::Address.state }
    user_id {User.last.id}
  end
end

