class RemoveResetPasswordTokenFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :reset_password_token, :string
  end
end
