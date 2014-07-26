require 'faker'

FactoryGirl.define do
  factory :order do
    food_place_id { FoodPlace.last.id }
    user_id {User.last.id}
    
    after(:create) do |order|
      order.menu_line_items << create(:menu_line_item)
      order.menu_line_items << MenuLineItem.create(menu_option_id: MenuOption.last.id, quantiy: Faker::Number.number(2))
    end

  end
end