class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  validates :name, length: {maximum: 20}, presence: true
  validates :second_name, length: {maximum: 20}, presence: true
  validates :middle_name, length: {maximum: 20}, presence: true
end
