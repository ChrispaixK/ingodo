class User < ApplicationRecord
    has_many :categories, dependent: destroy
    has_many :transfers, dependent: destroy

    validates :name, presence: true, lenght: {minimum: 2, too_short: '%<count> characters at least' }
end
