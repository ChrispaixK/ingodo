class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transfers, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, too_short: '%<count> characters at least' }
end
