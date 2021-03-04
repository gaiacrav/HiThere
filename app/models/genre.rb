class Genre < ApplicationRecord
  has_many :videos_genres
  has_many :videos, through: :videos_genres
end
