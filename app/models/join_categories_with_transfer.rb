class JoinCategoriesWithTransfer < ApplicationRecord
  belongs_to :category
  belongs_to :transfer
end
