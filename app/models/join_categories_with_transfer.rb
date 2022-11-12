class JoinCategoriesWithTransfer < ApplicationRecord
    belongs_to :category
    belongs_to :transfer

    validates :category_id, presence: true
    validates :transfer_id, presence: true
end
