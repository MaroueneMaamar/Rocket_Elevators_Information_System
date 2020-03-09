# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize( user )
    user ||= User.new

    # Define User abilities
    if user.is? :admin
      can :manage, Quotes , 
    else
      can :read, Quotes
    end
  end

end