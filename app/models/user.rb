class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :quotes
  has_many :leads
  has_many :buildings
  has_many :building_details

  belongs_to :role
  rolify

  after_create :assign_default_role

  def assign_default_role
    if self.role_id == 1
      self.add_role(:admin) if self.roles.blank?
    elsif self.role_id == 3
      self.add_role(:employee) if self.roles.blank?
    else
      self.add_role(:customer) if self.roles.blank?
    end
  end
end
