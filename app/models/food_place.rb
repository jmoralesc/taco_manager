class FoodPlace < ActiveRecord::Base
  belongs_to :user
  has_many :menu_options

  validates :name, :phone_number, :time, :address1, :address2, :state, :city, presence: true

  mount_uploader :photo, FoodPlaceUploader
end
