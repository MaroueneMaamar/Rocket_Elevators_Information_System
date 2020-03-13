class Adress < ApplicationRecord
    # belongs_to :user, optional: true
    # belongs_to :customer
    belongs_to :building
    # has_many :customer
    # has_many :building
end
