class Adress < ApplicationRecord
    belongs_to :customer
    belongs_to :building
end
