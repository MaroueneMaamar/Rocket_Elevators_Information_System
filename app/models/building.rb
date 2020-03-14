class Building < ApplicationRecord
    belongs_to :customer
    belongs_to :user
    belongs_to :adress

    # has_one :adress
    has_many :building_details
    has_many :batteries

    # validates_uniqueness_of :customer   
    # validates :customer, presence: true, uniqueness: true
end
