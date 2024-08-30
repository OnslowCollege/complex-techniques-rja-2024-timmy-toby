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

class mage_stat_block: 
	var player_class = "Mage"
	var health = 100
	var damage = 25
	var stamina = 20
	var moveset = []
	var karma = 0
	var karma_level = 0

var mage_stats = mage_stat_block.new()

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

	
	match chosen_class:
		"Mage":
			Assign_stats(mage_stats)
		"Paladin":
			Assign_stats(paladin_stat_block) 
		"Performer":
			Assign_stats(performer_stat_block)
		"Warrior":
			Assign_stats(warrior_stat_block)
		"Acolyte":
			Assign_stats(acolyte_stat_block)
	

func Assign_stats(chosen_class):
	print(chosen_class.get(player_class))
	print(mage_stats.get(player_class))
	
	print(chosen_class.player_class())
	
	player_class = chosen_class.player_class
	health = chosen_class.health
	damage = chosen_class.damage
	stamina = chosen_class.stamina
	moveset = chosen_class.moveset
	karma = chosen_class.karma
	karma_level = chosen_class.karma_level
	
	print(player_class, " = Player class", health, " = Maximum health", damage, " = Damage", stamina, " = Stamina", karma, " = Karma", karma_level, " = Karma Level")

