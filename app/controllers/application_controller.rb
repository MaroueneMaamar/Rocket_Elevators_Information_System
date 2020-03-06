class ApplicationController < ActionController::Base
<<<<<<< HEAD
    protect_from_forgery

    def authenticate_active_admin_user!
      authenticate_user!
      unless current_user.superadmin?
        flash[:alert] = "Unauthorized Access!"
        redirect_to root_path
      end
    end
=======
>>>>>>> parent of fd12552... Safety push before doing a superadmin to user table
end
