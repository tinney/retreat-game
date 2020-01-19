import consumer from "./consumer"

console.log("got the consumer for player");

consumer.subscriptions.create({ channel: "PlayersChannel" }, {
  received(data) {
    console.log("Received:");
    console.log(data);

    if (data.action === 'created') {
      if (data.is_player === true) {
        console.log("adding player")
        window.addPlayer(data)
      } else {
        console.log("adding resource")
        window.addResource(data)
      }
    } 

    if (data.action === "destroyed") {
      if (data.is_player) {
        console.log("removing player")
        window.removePlayer(data)
      } else {
        console.log("removing resource")
        window.removeResource(data)
      }
    }

    window.app.ticker.add((delta) => {
      window.players[data.id].position.set(data.x, data.y)
    });
  },
})