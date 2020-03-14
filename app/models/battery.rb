class Battery < ApplicationRecord
    belongs_to :bulding
    belongs_to :employee
    has_many :columns
end
