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
      #@genre = Genre.where(name: params[:genre]).first
      @videos = @genre.videos.sort.first(20)
    end
    @count = @videos.count
    @preference = Preference.new
  end

  def create
    @user = current_user
    if !params['array'].nil?
    params['array'].each do |video_id, value|
      if !current_user.videos.exists?(video_id)
        current_user.videos << Video.find(video_id)
      end
    end
      #if !Preference.where(video: Video.find(video_id), user: current_user).exists?
      #Preference.create(video: Video.find(video_id), user: @user)
    end
     #redirect to dashboard - Sara
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
