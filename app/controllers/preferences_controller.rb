class PreferencesController < ApplicationController
skip_before_action :verify_authenticity_token

  def matches
    # Eliseu: just an idea for a first criteria definition:
    # match_country = current_user.country
    # match_genre = current_user.medium.genre  # Eliseu: not sure about syntax

    # @matches = User.where(country: match_country).or(User.where(genre: match_genre))
    # Eliseu: Not sure about this - still needs validation from a TA
    @users = User.all
  end

  def new
    @preference = Preference.new
    @videos = Video.all.limit(10)
    @genres = Genre.all
  end

  def create
    @user = current_user
    @videos = Video.all
    current_user.videos.destroy_all
    params['array'].each do |key, value|
      Preference.create(video: @videos[key.to_i], user: @user)
    end #redirect to dashboard - Sara
    redirect_to new_preference_path
  end

  def show
    @preferences = preference.search(params[:search])
  end


private

  def preferences_params
    params.require(:preferences).permit(:user_id, :video_id)
  end
end
