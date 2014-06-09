class FoodPlace < ActiveRecord::Base
  belongs_to :user
  has_many :menu_options

  validates :name, :phone_number, :time, :address1, :address2, :state, :city, presence: true

  mount_uploader :photo, FoodPlaceUploader

  geocoded_by :full_street_address   
  after_validation :geocode

  def full_street_address
    [address1, city, state,'México'].compact.join(', ');
  end 
  
end
