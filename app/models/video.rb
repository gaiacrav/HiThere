class Video < ApplicationRecord

  belongs_to :user
  has_many :preferences


  validates :title, presence: true
  validates :genre, inclusion: { in: %w(romantic horror thriller scienceFiction comedy suspence historical documentary others),
   case_sensitive: false, message: "%{value} is not a valid genre" }
end
