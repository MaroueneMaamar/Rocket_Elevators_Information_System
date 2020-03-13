class Building < ApplicationRecord
    belongs_to :user, optional: true
end
