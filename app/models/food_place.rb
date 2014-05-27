class FoodPlace < ActiveRecord::Base
  belongs_to :user
  validates :name, :phone_number, :time, :address1, :address2, :state, :city, presence: true

end
