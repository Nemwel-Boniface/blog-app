class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :manage, Post, user: user

    return unless user.admin?

    can :manage, Post, user_id == user.id
  end
end
