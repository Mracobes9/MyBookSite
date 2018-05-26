class Author < ApplicationRecord
    validates :name, length: { maximum: 20}, presence: true
    validates :second_name, length: { maximum: 20}, presence: true
    validates :middle_name, length: { maximum: 20}, presence: true

    has_many :books, dependent: :destroy

    def getFioAuthor
      "#{second_name} #{name[0]}. #{middle_name[0]}."
    end
end
