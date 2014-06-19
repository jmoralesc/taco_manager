# Ability for Users' authorizations
class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
    can :read, Order, user_id: user.id
  end
end
