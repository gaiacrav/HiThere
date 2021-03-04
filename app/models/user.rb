class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :preferences
  has_many :videos, through: :preferences
  has_many :created_chatrooms, class_name: "Chatroom", foreign_key: 'creator_id'

  validates :first_name, :age, presence: true
end
