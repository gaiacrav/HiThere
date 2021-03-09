class ChatroomsController < ApplicationController
    def show
        @chatroom = Chatroom.find(params[:id])
        @message = Message.new
    end

    def create
        @chatroom = Chatroom.new(chatroom_params)
        @chatroom.creator = current_user
        @chatroom.name = "#{current_user.first_name} - #{@chatroom.user.first_name}"
        if @chatroom.save
          redirect_to @chatroom
        else
          render "preferences/matches"
        end
    end

    private

    def chatroom_params
        params.require(:chatroom).permit(:user_id)
    end

end


