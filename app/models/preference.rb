class Preference < ApplicationRecord
  belongs_to :user
  belongs_to :video
end

  def self.search(search)
    if search
      preference = Preference.find_by(name: search)
    if search
      self.where(preference_id: preference)
    else
      Preference.all
    end
  else
    Preference.all
  end
end

