class Ability
  include CanCan::Ability
  def initialize(user)
    # can :read, :all                 # allow everyone to read everything
    # return unless user.has_role? :admin
    

    if user.has_role? :admin
      can :manage, :all             # allow superadmins to do anything
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :read, :dashboard           # allow access to dashboard
    elsif user.has_role? :employee
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :read, :dashboard           # allow access to dashboard
      can :manage, [Lead, Quote]  # allow managers to do anything to products and users
    end
  end
end


# class Ability
#   include CanCan::Ability
#   def initialize(user)

#     if user.has_role? :admin
#       can :access, :all
#     elsif user.has_role? :employee
#       can :manage, :all
#     else
#       can :read, :all
#     end

#     # can :access, :rails_admin       # only allow admin users to access Rails Admin
#     # can :read, :dashboard           # allow access to dashboard
#     # if user.has_role? :superadmin
#     #   can :manage, :all             # allow superadmins to do anything
#   end
# end