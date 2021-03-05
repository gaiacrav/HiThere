class PreferencesController < ApplicationController
skip_before_action :verify_authenticity_token

  def matches
    # Eliseu: just an idea for a first criteria definition:
    # match_country = current_user.country
    # match_genre = current_user.medium.genre  # Eliseu: not sure about syntax

    # @matches = User.where(country: match_country).or(User.where(genre: match_genre))
    # Eliseu: Not sure about this - still needs validation from a TA
    user = current_user
    preferences_video_ids = preferences_video_ids = user.preferences.map(&:video_id)

    @users = User.joins(:preferences).where(preferences: {video_id: preferences_video_ids}).where.not(id: user.id).uniq
  end

  def new
    @genres = Genre.all
    @videos = Video.all.limit(0)
    if params[:genre].present?
      @genre = Genre.find(params[:genre])
      @videos = @genre.videos.limit(20)
    end
    @count = @videos.count
    @preference = Preference.new
  end

  def create
    @user = current_user
    @videos = Video.all
    params['array'].each do |key, value|
      Preference.create(video: @videos[key.to_i], user: @user)
    end #redirect to dashboard - Sara
    redirect_to matches_preferences_path
    # @preferences.save!
  end

  def show
    @preferences = preference.search(params[:search])
  end


private

  def preferences_params
    params.require(:preferences).permit(:user_id, :video_id)
  end
end
