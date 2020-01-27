# 💚 2020 Retreat

Welcome to the Test Double 2020 Retreat -- Island Survival 
The object of the challenge is to survive the longest on the island!

## How to Play
You and your retreat buddy will work together to using the game API to create players, move around the island looking for food and fresh water. The team who has the longest living player by the end of the session will be the winner! 

Each team can take as many tries as they want but only one active player at a time. Use the API to create a player distributing 20 stats across 4 different categories. Each movement takes the player 1 day and consumes water and food based on your stats. 

# API
Set your team's id in the html headers under the variable TEAM. 
The API is hosted at http://retreat-game.herokuapp.com/api

## Creating Players
Post to the /api/players endpoint with the following stats

*Distribute upto 20 points across these 4 stats*

* Name -  `player[name]` - Name your player to help identify it's version. 
* Food max 10 - `player[food_stat]` - How many units of food you can carry at once.
* Water max 10 - `player[water_stat]` - How many units of water you can carry at once.
* Stamina max 5 - `player[stamina_stat]` - How often your player needs to eat food. eg. stamina of 3 eats every 3 days.
* Strength max 10 - `player[strength_stat]` - Used to determine outcome when sharing a space with an opponent player with more strength will take food from the other.

To create a player post to the players endpoint with your Team ID set in the request header. Each team can have 1 active player at a time. Creating a player will deactive any currently active player your team has. 

```
http://localhost:3000/api/players?player[name]=Dustin&player[water_stat]=5&player[food_stat]=5&player[stamina_stat]=2&player[strength_stat]=5 
```

### Response
```
{
    "player": {
        "water_stat": 8,
        "food_stat": 5,
        "stamina_stat": 2,
        "strength_stat": 5,
        "active": true,
        "days_active": 0,
        "days_without_water": 0,
        "days_without_food": 0,
        "water_count": 5,
        "food_count": 5,
        "x": 28,
        "y": 1
    },
    "board": [
        {
            "x": 18,
            "y": 1,
            "is_water": true,
            "is_food": false,
            "is_player": false
        },
        {
            "x": 28,
            "y": 18,
            "is_water": false,
            "is_food": true,
            "is_player": false
        },
        {
            "x": 30,
            "y": 1,
            "is_water": false,
            "is_food": false,
            "is_player": true,j
        },
    ]
}
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
post http://retreat-game.herokuapp.com/api/moves?direction=?

```


### What happens when I run out of Food/Water
Players can survive 10 days without food and 5 days without water.


### Moving to a Water Title
When you move to a water tile you will refill 100% of your water storage. Note water tiles never deplete.

### Moving to a Food Title
Food tiles are limited in quantify, and dissappear when depleted. When you move to a food tile you will refill as much food as you can. Food tiles will randomly appear throughout the game.

### Moving to another player's tile
When 2 players are on the same tile the player with more strength will win and take the other players food.



24	Adam Lukens & Kerry Diehl
25	Andy Vida &	Stephen Vance	26	Brittany Ann Moore & Stephen Rivas, Jr.
27	Cliff Pruitt & Raelyn Bangel
28	Dan Thompson & Jeremy Fairbank
29	Daniel Flynn & Marshall Serlin
30	Dave Mosher & Tom Nightingale
31	Dayton Nolan & Jason Grosz
32	Eric Newbury & Sam Jones
33	Elmar Valmores & Lee Quarella
34	Ilana Corson & Kevin Baribeau
35	Jamie Phelps & Jason Karns
36	Jason Allen & Marla Brizel Zeschin
37	Joel Helbling & Kaleb Lape
38	Josh Starkey & Rob Vitaro
39	Kyle Adams & Sara Jackson
40	Marc Peabody & Steve Jackson
41	Micah Adams & Chris Caragianis
42	Nate Kandler & Neal Lindsayk
43	Ross Brandes & Tommy Groshong