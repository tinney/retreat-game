# 💚 2020 Retreat

Welcome to the Test Double 2020 Retreat Survival Game. 

The object of the game is to survive the longest in the desert!  


## Rules of the Game

Teams will create players distributing 20 points across 4 stats, food, water, stamina and strength. 
Teams will then move players around the board to find water, food and other players.

*The team who player survives the most days wins!*

## Playing

Each team of 2 agents will write a "bot" to play the game by consuming a small retreat-game API. All teams will play on the same board. Teams can take multiple attempts adjusting their code or the player stats for each attempt.  There is no penatly for attemps and your longest surviving attempt will count toward your score. 

## Creating Players

```Ruby
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
```

### Stats


### Moving 

Each movement takes 1 day. Players eat 1 unit of food and 1 unit of water per day. 

POST MOVING API HERE
NORTH SOUTH EAST WEST

### What happens when I run out of Food/Water
Players can survive 21 days without food and 5 days without water (127 hours Thanks James Franco). 


* Moving to a Water Title

When you move to a water tile you will refill 100% of your water storage. Note water tiles never deplete.

* Moving to a Food tile

Food tiles are limited in quantify, and dissappear when depleted. When you move to a food tile you will refill as much food as you can. Food tiles will randomly appear throughout the game.

* Landing on another Player

When 2 players are on the same tile the player who has been around for less days will sacrifice 1/2 of their food and 1/2 of their water to the player whoo has been around for more days.  If the players have been around for the same number of days they will combine their food and water and split it between each other.  