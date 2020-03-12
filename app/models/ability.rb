class Ability
  include CanCan::Ability
  def initialize(user)

    p 'KEVIN'
    p user.has_role? :admin

    if user.has_role? :admin
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :manage, :all
    elsif user.has_role? :employee
      can :manage, Post
    else
      can :read, :all
    end
    
    # user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :manage, Post, user_id: user.id
    #     can :read, :all
    #   end

    # can :access, :rails_admin       # only allow admin users to access Rails Admin
    # can :read, :dashboard           # allow access to dashboard
    # if user.has_role? :superadmin
    #   can :manage, :all             # allow superadmins to do anything
    # elsif user.role? :manager
    #   can :manage, [User, Product]  # allow managers to do anything to products and users
    # elsif user.role? :sales
    #   can :update, Product, hidden: false  # allow sales to only update visible products
    # end
  end
end