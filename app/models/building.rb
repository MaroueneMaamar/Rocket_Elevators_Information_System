class Building < ApplicationRecord
    # belongs_to :customer
    # belongs_to :adress

    # has_one :adress
    has_many :building_details
    has_many :batteries
end
