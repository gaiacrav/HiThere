class Video < ApplicationRecord
  belongs_to :user
  has_many :preferences
  has_many :videos_genres
  has_many :genres, through: :videos_genres

  validates :title, presence: true
end
