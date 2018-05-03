class Book < ApplicationRecord
    validates :name, length: {maximum: 30}, presence: true
    validates :description, length: {maximum: 200}, presence: true
    belongs_to :author
    mount_uploader :book_cover, PictureUploader
end
