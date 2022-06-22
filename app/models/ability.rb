class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?
    can :destroy, [Post, Comment]
    return unless user.admin?
    can :destroy, [Post, Comment]
  end
end
