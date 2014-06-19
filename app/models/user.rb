# Model for Users
class User < ActiveRecord::Base
  has_many :food_places
  has_many :orders
  has_many :menu_line_items
  has_many :roles, through: :user_role
 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  devise :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin]

  mount_uploader :avatar, UserAvatarUploader

 
  # roles = [:user]

  def is?(requested_role)
    role == requested_role.to_s
  end

  attr_accessor :login

  def apply_omniauth(omni)
   authentications.build(:provider => omni['provider'],
   :uid => omni['uid'],
   :token => omni['credentials'].token,
   :token_secret => omni['credentials'].secret)
    session[:omniauth] = omni.except('extra')
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
      else
       super
    end
  end

  def self.find_for_facebook_oauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.username = auth.info.name
    avatar_url = process_uri(auth.info.image)
    user.remote_avatar_url = avatar_url
  end
 end

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

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.uid + "@twitter.com").first
      if registered_user
        return registered_user
      else

        user = User.create(username:auth.extra.raw_info.name,    
                            provider:auth.provider,
                            uid:auth.uid,
                            remote_avatar_url: auth.extra.raw_info.avatar_url, 
                            email:auth.uid+"@twitter.com",
                            password:Devise.friendly_token[0,20],
                          )
      end

    end
  end

  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else

        user = User.create(username:auth.info.first_name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end

    end
  end   

  private

 def self.process_uri(uri)
   avatar_url = URI.parse(uri)
   avatar_url.scheme = 'https'
   avatar_url.to_s
end
end
