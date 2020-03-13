class UsersController < ApplicationController
    def user_params
        # params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
        params.require(:user).permit(:username, :email, :company, :password, :password_confirmation, :remember_me, :role)
    end
end

