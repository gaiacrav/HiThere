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
    @genres = Genre.all
    if params["/preferences/new"].present?
      @videos = Genre.find([params["/preferences/new"]["genre"].to_i]).first.videos.limit(2)
    else
      @videos = Video.all
    end
    @preference = Preference.new
  end

  def create
    @user = current_user
    @videos = Video.all
    current_user.videos.destroy_all
    params['array'].each do |key, value|
      Preference.create(video: @videos[key.to_i], user: @user)
    end #redirect to dashboard - Sara
    redirect_to matches_preferences_path
  end

  def show
    @preferences = preference.search(params[:search])
  end


private

  def preferences_params
    params.require(:preferences).permit(:user_id, :video_id)
  end
end
