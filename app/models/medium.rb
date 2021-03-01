class Medium < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :genre, inclusion: { in: %w(romantic horror thriller scienceFiction comedy suspence historical documentary others),
   case_sensitive: false, message: "%{value} is not a valid genre" }
end
