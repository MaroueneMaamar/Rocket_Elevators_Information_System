class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quotes
  has_many :leads
  has_many :buildings
  has_many :building_details
end
