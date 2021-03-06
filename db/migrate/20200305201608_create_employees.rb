class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name, null: false, default: ""
      t.string :firstName, null: false, default: ""
      t.string :title, null: false, default: ""
       
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      #t.string :encrypted_password, null: false, default: ""
 
      ## Recoverable
      ##t.string   :reset_password_token
      # t.datetime :reset_password_sent_at
 
      # ## Rememberable
      # t.datetime :remember_created_at
 
      # ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip
 
      # ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email

      # t.references :admin_users, foreign_key: true

      t.timestamps
    end
  end
end