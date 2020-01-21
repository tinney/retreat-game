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
        window.removePlayer(data.id)
      } else {
        console.log("removing resource")
        window.removeResource(data.id)
      }
    }

    window.app.ticker.add((delta) => {
      window.movePlayer(data.id, data.x, data.y) 
    });
  },
})