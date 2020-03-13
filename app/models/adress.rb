class Adress < ApplicationRecord
    belongs_to :user, optional: true
end
