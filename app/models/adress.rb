class Adress < ApplicationRecord
    has_one :building
    # has_one :customer
    has_many :customer
    # belongs_to :building, optional: true
    # belongs_to :customer, optional: true
    # belongs_to :building
    # belongs_to :customer
end
