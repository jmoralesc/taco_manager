class MenuOption < ActiveRecord::Base
  belongs_to :food_place
  
  validates :name, :price, presence: true
  
  mount_uploader :photo, MenuOptionUploader
end