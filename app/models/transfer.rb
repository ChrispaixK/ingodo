class Transfer < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :join_categories_with_transfers, dependent: :destroy
  has_many :categories, through: :join_categories_with_transfers

  validates :name, presence: true
  validates :amount, presence: true
end
