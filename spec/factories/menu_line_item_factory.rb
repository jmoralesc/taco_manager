require 'faker'

FactoryGirl.define do
  factory :menu_line_item do
    menu_option_id { MenuOption.last.id }
    user_id {User.last.id}
  end
end