class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # This is what sets up the different abilities
    if user.new_record?
      not_signed_in
    else
      if user.is_admin
        signed_in_with_roles(user)
      else
        signed_in(user)
      end
    end
  end

  def not_signed_in
    cannot :manage, :all
  end

  def signed_in(user)
    cannot :manage, :all
  end

  def signed_in_with_roles(_user)
    can :acces, Admin
    can :manage, :all
  end
end
