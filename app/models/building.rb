class Building < ApplicationRecord
    belongs_to :customer
    has_one:adress
    has_many :building_details
    has_many :batteries
end
