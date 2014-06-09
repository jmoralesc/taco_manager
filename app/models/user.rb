class User < ActiveRecord::Base
  has_many :food_places 
  has_many :orders
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserAvatarUploader
end
