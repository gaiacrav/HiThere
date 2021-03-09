class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )

  other_user = @chatroom.creator
  other_user = @chatroom.user if other_user == current_user

      NotificationChannel.broadcast_to(
        other_user,
        # render_to_string(partial: "message", locals: { message: @message })
        render_to_string(partial: "components/notification", locals: { chatroom: @chatroom })
      )

      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
 