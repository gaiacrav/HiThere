class PreferencesController < ApplicationController
skip_before_action :verify_authenticity_token

  def matches
    @users = current_user.matches.limit(30)
    @chatroom = Chatroom.new
  end

  def new
    @genres = Genre.all
    @videos = Video.all.limit(0)
    if params[:genre].present?
      @genre = Genre.find(params[:genre])
      @videos = @genre.videos.sort.first(20)
    end
    @count = @videos.count
    @preference = Preference.new
  end

  def create
    @user = current_user
    @videos = Video.all
    params['array'].each do |video_id, value|
      Preference.create(video: Video.find(video_id), user: @user)
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
