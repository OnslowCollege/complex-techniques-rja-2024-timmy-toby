extends Node

## Global storage for variables related to player statistics
## Conviniently, able to be called as if it was a normal variable yippee!!!!!.

# Actual variables
var player_class: String
var health: int
var damage: int
var stamina: int
var karma: int
var karma_level: int


## Stat block classes
# Theoretically one more improvement could be to export values in the interests of balancing.

class wizard_stat_block: 
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []

class paladin_stat_block: 
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []

class performer_stat_block: 
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []

class warrior_stat_block: 
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []

class acolyte_stat_block: 
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []

## Class assignment function

func Assign_class():
	pass
