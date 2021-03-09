import consumer from "./consumer";

const initNotificationCable = () => {
  const userContainer = document.getElementById('user-name');
  if (userContainer) {
    const id = userContainer.dataset.currentUserId;

    consumer.subscriptions.create({ channel: "NotificationChannel", id: id }, {
      received(data) {
        const messagesContainer = document.getElementById('messages');
        if (!messagesContainer) {
        console.log(data); // called when data is broadcast in the cable
        const notificationPlace = document.getElementById('notification-place')
        notificationPlace.innerHTML= data; 
        }
      },
    });
  }
}

export { initNotificationCable };