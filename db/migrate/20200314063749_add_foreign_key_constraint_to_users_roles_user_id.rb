class AddForeignKeyConstraintToUsersRolesUserId < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users_roles, :users
  end
end
