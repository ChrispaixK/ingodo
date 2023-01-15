# class Category < ApplicationRecord
#   belongs_to :user, dependent: :destroy
#   has_many :join_categories_with_transfers, dependent: :destroy
#   has_many :transfers, through: :join_categories_with_transfers

#   validates :name, :icon, presence: true
# end
