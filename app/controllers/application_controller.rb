class ApplicationController < ActionController::Base
    protect_from_forgery

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      added_attrs = [:username, :email, :company, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    # def set_current_user
    #   User.current = current_user
    # end

    # def authenticate_user!
    #   if user_signed_in?
    #     super
    #   else
    #     redirect_to new_user_session_url 
    #   end
    # end

    # def authenticate_user!
    #   redirect_to new_user_session_url unless user_signed_in?
    # end

    # before_action :authenticate_user!, only: [:show]

    # def authenticate_active_admin_user!
    #   authenticate_user!
    #   unless current_user.superadmin?
    #     flash[:alert] = "Unauthorized Access!"
    #     redirect_to root_path
    #   end
    # end
end
