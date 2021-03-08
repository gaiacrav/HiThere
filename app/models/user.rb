class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :preferences
  has_many :videos, through: :preferences
  has_many :created_chatrooms, class_name: "Chatroom", foreign_key: 'creator_id'
  has_one_attached :photo
  validates :first_name, :birth_date, presence: true

  def matches
    User.joins(:preferences).where(preferences: {video_id: preferences_video_ids}).where.not(id: self.id).distinct
  end

  def preferences_video_ids
    self.preferences.map(&:video_id)
  end

  def videos_in_common_with(user)
    self.videos.joins(:preferences).where(preferences: {video_id: user.preferences_video_ids}).distinct
  end

  def age(birth_date)
    return (Date.today - Date.new(year, month, day)).to_i
  end

end
