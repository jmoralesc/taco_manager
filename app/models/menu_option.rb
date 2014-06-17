# Model for Menu options
class MenuOption < ActiveRecord::Base
  belongs_to :food_place

  has_many :menu_line_items

  validates :name, :price, presence: true

  mount_uploader :photo, MenuOptionUploader
end
