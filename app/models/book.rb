class Book < ApplicationRecord
    validates :name, length: {maximum: 30}, presence: true
    validates :description, length: {maximum: 200}, presence: true
    belongs_to :author
    mount_uploader :book_cover, PictureUploader

    has_many :comments
    has_many :commentators, through: :comments, foreign_key: "book_id", source: :user

    has_many :favorite_books
    has_many :fans, through: :favorite_books, source: :user
end
