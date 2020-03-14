class Customer < ApplicationRecord
    belongs_to :user
    belongs_to :adress

    # has_one :adress
    # has_many :adress
    has_many :buildings
end
