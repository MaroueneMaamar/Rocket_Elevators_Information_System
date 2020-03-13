class Elevator < ApplicationRecord
    belongs_to :user, optional: true
end
