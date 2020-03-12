class Lead < ApplicationRecord
    has_one_attached :attachment
    belongs_to :user, optional: true
end
