import consumer from "./consumer"

console.log("got the consumer for player");

consumer.subscriptions.create({ channel: "PlayersChannel" }, {
  received(data) {
    console.log("Received:");
    console.log(data);
    if (data.action === 'created') {
      window.addPlayer(data)
    } 

    window.app.ticker.add((delta) => {
      window.players[data.id].position.set(data.x, data.y)
    });
  },
})