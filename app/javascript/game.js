import * as PIXI from 'pixi.js'
import { SSL_OP_EPHEMERAL_RSA } from 'constants';


const loader = new PIXI.Loader()
const players_container = new PIXI.Container()
const resource_container = new PIXI.Container()
const BOARD_WIDTH = 40
const BOARD_HEIGHT = 40
const BOARD_MULTIPLIER = 20

// note game heights are duplicated
const app = new PIXI.Application({ width: BOARD_WIDTH * BOARD_MULTIPLIER, height: BOARD_HEIGHT * BOARD_MULTIPLIER, transparent: true, resolution: window.devicePixelRatio || 1, });

window.app = app;
// TODO update to be a single sprite container
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

function movePlayer(id, x, y) {
  window.players[id].position.set(x * BOARD_MULTIPLIER, y * BOARD_MULTIPLIER)
}

function addPlayer(player) {
  // build the player from the texture
  console.log("Adding player at x: " + player.x + " y: " + player.y)
  console.log(player)

  let sprite = new PIXI.Text('🚶', {fontSize: 10, align : 'center'})
  sprite.x = player.x * BOARD_MULTIPLIER
  sprite.y = player.y * BOARD_MULTIPLIER

  players_container.addChild(sprite);
  window.players[player.id] = sprite
}

function addResources(resources) {
  resources.forEach(addResource)
}

function removeResource(id) {
  let resource = window.resources[id]
  resource_container.addChild(resource);
}

function removePlayer(id) {
  let resource = window.players[id]
  resource_container.addChild(resource);
}

function addResource(resource) {
  console.log("Adding resource at x: " + resource.x + " y: " + resource.y)
  console.log(resource)

  let sprite_text = '💧';
  if (resource.is_food == true) {
    sprite_text = '🌭';
  }
  
  let sprite = new PIXI.Text(sprite_text, {fontSize: 10, align : 'center'})
  sprite.x = resource.x * BOARD_MULTIPLIER
  sprite.y = resource.y * BOARD_MULTIPLIER

  resource_container.addChild(sprite);
  window.resources[resource.id] = sprite
}

window.addPlayer = addPlayer
window.removePlayer = removePlayer
window.removeResource = removeResource
window.movePlayer = movePlayer
window.addResource = addResource

window.startGame = function(players, resources) {
  const f = function() {
    setup(players, resources);
  }
  loader.add(PLAYER_SPRITES).load(f);
}