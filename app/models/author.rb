class Author < ApplicationRecord
    validates :name, length: { maximum: 20}, presence: true
    validates :second_name, length: { maximum: 20}, presence: true
    validates :middle_name, length: { maximum: 20}, presence: true
end
