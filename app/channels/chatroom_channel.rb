class ChatroomChannel < ApplicationCable::Channel
  # stream_from "some_channel"
    def subscribed
      chatroom = Chatroom.find(params[:id])
      stream_for chatroom
    end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
