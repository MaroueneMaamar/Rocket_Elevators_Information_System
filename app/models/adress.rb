class Adress < ApplicationRecord
    # has_one :buildings
    # has_one :customers
    belongs_to :building, optional: true
    belongs_to :customer, optional: true
end
