import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('chat');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const div = document.getElementById('chat-scrollbar');
    const userContainer = document.getElementById('user-name');
    const currentUserId = userContainer.dataset.currentUserId;
    div.scrollTop = div.scrollHeight;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        div.insertAdjacentHTML('beforeend', data); 
        div.scrollTop = div.scrollHeight;
        const lastMessage = div.querySelector(".message-container:last-child")
        console.log(lastMessage.dataset.author)
          console.log(currentUserId)
        if (parseInt(lastMessage.dataset.author) == parseInt(currentUserId)){
          lastMessage.classList.add("self-message")
        }
        else {
          lastMessage.classList.remove("self-message")

        }
        const form = document.getElementById('new_message');
        if (parseInt(lastMessage.dataset.author) == parseInt(currentUserId)) {
          form.reset();
        }
        
      },
    });
  }
}

export { initChatroomCable };


  
    