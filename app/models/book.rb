class Book < ApplicationRecord
    validates :name, length: {maximum: 30}, presence: true
    belongs_to :author
end
