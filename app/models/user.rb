class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  validates :name, length: {maximum: 20}, presence: true
  validates :second_name, length: {maximum: 20}, presence: true
  validates :middle_name, length: {maximum: 20}, presence: true
  mount_uploader :avatar, PictureUploader

  has_many :comments
  has_many :commented_books, through: :comments, foreign_key:"user_id", source: :book
end
