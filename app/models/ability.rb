# Ability for Users' authorizations
class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Order, user_id: user.id
  end
end
