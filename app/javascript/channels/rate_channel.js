import consumer from "./consumer"

consumer.subscriptions.create("RateChannel", {
  connected() {
    console.log("Connected to rate");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data.content)
  }
});
