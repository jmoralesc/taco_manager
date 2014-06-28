require 'faker'

FactoryGirl.define do
  factory :order do
    food_place_id { FoodPlace.last.id }
    user_id {User.last.id}
    
    after(:create) do |order|
      order.menu_line_items {create :menu_line_item} 
    end
    
  end
end