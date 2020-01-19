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

  let sprite = new PIXI.Text('🚶', {fontSize: 12, align : 'center'})
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

  let sprite = new PIXI.Text('💧', {fontSize: 12, align : 'center'})

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