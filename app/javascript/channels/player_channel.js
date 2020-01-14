import consumer from "./consumer"

console.log("got the consumer for player");

consumer.subscriptions.create({ channel: "PlayersChannel" }, {
  received(data) {
    if (data.action === 'created') {
      window.addPlayer(data)
    } 

    window.app.ticker.add((delta) => {
      window.players[data.id].position.set(data.x, data.y)
    });
    console.log("received:");
    console.log(data);
  },
})