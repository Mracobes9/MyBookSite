class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :book

    validates :text, length: {maximum: 100}, presence: true
end
