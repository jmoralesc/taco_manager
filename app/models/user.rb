# Model for Users
class User < ActiveRecord::Base
  has_many :food_places
  has_many :orders
  has_many :menu_line_items
  has_many :roles, through: :user_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  mount_uploader :avatar, UserAvatarUploader

  # roles = [:user]

  def is?(requested_role)
    role == requested_role.to_s
  end

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(
        ['lower(username) = :value OR lower(email) = :value',
         { value: login.downcase }]
      ).first
      else
        where(conditions).first
    end
  end
end
