class Customer < ApplicationRecord
    belongs_to :user
    has_many :buildings
    has_many :adresses
end
