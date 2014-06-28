# Ability for Users' authorizations
class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
    if user.admin? 
      can :manage, :all
    else 
      can :update, FoodPlace, user_id: user.id
      can :read, Order, user_id: user.id
    end
  end

end
