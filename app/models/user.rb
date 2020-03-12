class User < ApplicationRecord
  has_many :admin_users
  has_many :employees
  has_many :customers
  has_many :quotes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
end
