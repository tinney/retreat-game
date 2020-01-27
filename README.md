# 💚 2020 Retreat

Welcome to the Test Double 2020 Retreat -- Island Survival 
The object of the challenge is to survive the longest on the island!


## How to Play
You and your retreat buddy will work together to using the game API to create players,  move around the board in search of food, water and other players. The team who has the longest living player by the end of the session will be the winner! 


## Rules of the Game

# API

Set your team's id in the html headers under the variable TEAM. 
The API is hosted at http://retreat-game.herokuapp.com/api

## Creating Players
Post to the /api/players endpoint with the following stats

*Distribute upto 20 points across these 4 stats*

* Name - Name your player to help identify it's version. 
* Food max 10 - `food_stat` - How many units of food you can carry at once.
* Water max 10 - `water_stat` - How many units of water you can carry at once.
* Stamina max 5 - `stamina_stat` - How often your player needs to eat food. eg. stamina of 3 eats every 3 days.
* Strength max 10 - `strength_stat` - Used to determine outcome when sharing a space with an opponent player with more strength will take food from the other.

To create a player post to the players endpoint with your Team ID set in the request header. Each team can have 1 active player at a time. Creating a player will deactive any currently active player your team has. 

```
http://localhost:3000/api/players?player[name]=Dustin&player[water_stat]=5&player[food_stat]=5&player[stamina_stat]=2&player[strength_stat]=5 
```

## Show Player
To see where your player is without making a move you can use the show endpoint

```
  get http://retreat-game.herokuapp.com/api/player

```

### Moving 
Each movement takes 1 day. Players eat 1 unit of food and 1 unit of water per day with a stamina of 1. 

To move post your direction to
Directions: NORTH SOUTH EAST WEST

```
post http://retreat-game.herokuapp.com/api/moves?direction=NORTH

```

### What happens when I run out of Food/Water
Players can survive 10 days without food and 5 days without water.


### Moving to a Water Title
When you move to a water tile you will refill 100% of your water storage. Note water tiles never deplete.

### Moving to a Food Title
Food tiles are limited in quantify, and dissappear when depleted. When you move to a food tile you will refill as much food as you can. Food tiles will randomly appear throughout the game.

### Moving to another player's tile
When 2 players are on the same tile the player with more strength will win and take the other players food.