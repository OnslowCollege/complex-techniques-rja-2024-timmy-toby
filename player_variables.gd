extends Node

## Global storage for variables related to player statistics
## Conviniently, able to be called as if it was a normal variable yippee!!!!!.

# Actual variables
var player_class: String

var health: int
var damage: int
var stamina: int
var moveset: Array

var karma: int
var karma_level: int


## Stat block classes
# Theoretically one more improvement could be to export values in the interests of balancing.

class wizard_stat_block: 
	var player_class = "Wizard"
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []
	var karma = 0
	var karma_level = 0

class paladin_stat_block: 
	var player_class = "Paladin"
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []
	var karma = 0
	var karma_level = 0


class performer_stat_block: 
	var player_class = "Performer"
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []
	var karma = 0
	var karma_level = 0

class warrior_stat_block: 
	var player_class = "Warrior"
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []
	var karma = 0
	var karma_level = 0

class acolyte_stat_block: 
	var player_class = "Acolyte"
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []
	var karma = 0
	var karma_level = 0

## Class assignment function

func Assign_class(chosen_class):
	pass
