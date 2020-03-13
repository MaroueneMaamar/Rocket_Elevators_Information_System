class Adress < ApplicationRecord
    # belongs_to :user, optional: true
    belongs_to :customer
    belongs_to :building
end
