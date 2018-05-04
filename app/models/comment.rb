class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :book

    validates :text, length: {maximum: 100}, presence: true
    validates :is_moderate, presence: true
end
