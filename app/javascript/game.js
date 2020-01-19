import * as PIXI from 'pixi.js'
import { SSL_OP_EPHEMERAL_RSA } from 'constants';


const loader = new PIXI.Loader()
const players_container = new PIXI.Container()
const resource_container = new PIXI.Container()

// note game heights are duplicated
const app = new PIXI.Application({ width: 600, height: 600, transparent: true, resolution: window.devicePixelRatio || 1, });

window.app = app;
window.players = [];
window.resources = [];

function setup(players, resources) {
  document.body.appendChild(app.view);
  app.stage.addChild(players_container);
  app.stage.addChild(resource_container);
  addPlayers(players)
  addResources(resources)
}

function addPlayers(players) {
  players.forEach(addPlayer)
}

function addPlayer(player) {
  // build the player from the texture
  console.log("Adding player at x: " + player.x + " y: " + player.y)
  console.log(player)
  let texture = PIXI.utils.TextureCache[window.PLAYER_SPRITES]; // load the texture
  texture.frame = new PIXI.Rectangle(12, 353, 30, 30) // crop to the sprite
  let sprite = new PIXI.Sprite(texture) 

  // Position on the canvas
  sprite.height = 10
  sprite.width = 10
  sprite.x = player.x
  sprite.y = player.y

  players_container.addChild(sprite);
  window.players[player.id] = sprite
}

function addResources(resources) {
  resources.forEach(addResource)
}

function addResource(resource) {
  console.log("Adding resource at x: " + resource.x + " y: " + resource.y)
  console.log(resource)

  const sprite = PIXI.Sprite.from(window.WATER_SPRITE);

  // // Position on the canvas
  sprite.height = 10 
  sprite.width = 10 
  sprite.x = resource.x
  sprite.y = resource.y

  resource_container.addChild(sprite);
  window.resources[resource.id] = sprite
}

window.addPlayer = addPlayer
window.startGame = function(players, resources) {
  const f = function() {
    setup(players, resources);
  }
  loader.add(PLAYER_SPRITES).load(f);
}
    // if (player2.visible) {
    //   player2.visible = false
    //   player.visible = true
    // } else {
    //   player.visible = false
    //   player2.visible = true
    // }
    // if (player.x >= 800) {
    //   player.x = 1
    //   player.y = 1
    //   player2.x = 1
    //   player2.y = 1
    // } else {
    //   player.vx = 2
    //   player.vy = 2
    //   player2.x +=2
    //   player2.y +=2
    //   player.x += 2
    //   player.y += 2
    // }
      // rotate the container!
      // use delta to create frame-independent transform
      //container.rotation -= 0.01 * delta;




// Center bunny sprite in local container coordinates
//container.pivot.x = container.width / 2;
//container.pivot.y = container.height / 2;


// this.setInterval(() => {
//   var x = jake.x + 20
//   var y = jake.y + 10 
//   jake.position.set(x, y)
// }, 
// 100)


// function draw() {
//   console.log("got here")
//   globalID = requestAnimationFrame(draw);
// }

//   var canvas = document.getElementById('board');
//   canvas.width = 1000;
//   canvas.height = 1000;
//   var context = canvas.getContext('2d');
//   var jakeImg = document.getElementById("jake");
//   var jake = context.drawImage(jakeImg, 2, 10, 80, 80, 10, 10, 20, 20);


  // $("#stop").on("click", function() {
  //   cancelAnimationFrame(globalID);
  // });

  // $("#start").on("click", function() {
  //   globalID = requestAnimationFrame(draw);
  // });
// };