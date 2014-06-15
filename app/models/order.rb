class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :food_place
  has_many :menu_line_items
  accepts_nested_attributes_for :menu_line_items, :reject_if => :all_blank, :allow_destroy => true
end