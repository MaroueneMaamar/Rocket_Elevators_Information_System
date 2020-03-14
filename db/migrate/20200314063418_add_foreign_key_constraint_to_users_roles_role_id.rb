class AddForeignKeyConstraintToUsersRolesRoleId < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users_roles, :roles
  end
end