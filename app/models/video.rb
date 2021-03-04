class Video < ApplicationRecord
  has_many :preferences
  has_many :users, through: :preferences
  has_many :videos_genres
  has_many :genres, through: :videos_genres

  validates :title, presence: true

  def genre
    genre_names_array = genres.map do |genre|
      genre.name
    end
    genre_names_array.join(", ")
  end

end
