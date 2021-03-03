class Video < ApplicationRecord
  has_many :prefeneces
  has_many :users, through: :preferences

  validates :title, presence: true
  validates :genre, inclusion: { in: %w(romantic horror thriller scienceFiction comedy suspence historical documentary others),
   case_sensitive: false, message: "%{value} is not a valid genre" }
end
