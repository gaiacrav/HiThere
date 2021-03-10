import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('chat');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const div = document.getElementById('chat-scrollbar');
    div.scrollTop = div.scrollHeight;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        div.insertAdjacentHTML('beforeend', data); 
        div.scrollTop = div.scrollHeight;
        const form = document.getElementById('new_message');
        form.reset();
      },
    });
  }
}

export { initChatroomCable };
