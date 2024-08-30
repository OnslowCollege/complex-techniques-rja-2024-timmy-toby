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

var mage_class: Object
var paladin_class: Object
var performer_class: Object
var warrior_class: Object
var acolyte_class: Object

# Stats are held in an array before assignment to the classes themselves.
const mage_stats: Array = [
	"Mage", # player_class
	100, # health
	25, # damage
	20, # stamina
	[], # moveset
	0, # karma
	0, # karma_level
	20, # test
]

# Used as the input for property names when adding stats to the instances
const property_key: Array = [
	"player_class",
	"health",
	"damage",
	"stamina",
	"moveset",
	"karma",
	"karma_level",
	"test",
]

## Stat block classes
# Theoretically one more improvement could be to export values in the interests of balancing.

class class_stat_block: # Funny name lol
	var player_class: String
	
	var health: int
	var damage: int
	var stamina: int
	var moveset: Array
	
	var karma: int
	var karma_level: int
	var test


## Class assignment function

func Assign_class(chosen_class):
	
	for i in chosen_class.size():
		match chosen_class:
			mage_stats:
				print("Reached", i)
				print(property_key[i])
				print(mage_stats[i])
				mage_class = class_stat_block.new()
				mage_class.set(property_key[i], mage_stats[i])
			"Paladin":
				pass
			"Performer":
				pass
			"Warrior":
				pass
			"Acolyte":
				pass
	match chosen_class:
		mage_stats:
			print(mage_class.player_class)
			print(mage_class.test)
			print(mage_class.health)
			Assign_stats(mage_class)
			
		"Paladin":
			pass
		"Performer":
			pass
		"Warrior":
			pass
		"Acolyte":
			pass

func Assign_stats(class_to_be_assigned):
	
	print(class_to_be_assigned.player_class)
	print(class_to_be_assigned.test)
	
	player_class = class_to_be_assigned.get("player_class")
	health = class_to_be_assigned.health
	damage = class_to_be_assigned.damage
	stamina = class_to_be_assigned.stamina
	moveset = class_to_be_assigned.moveset
	karma = class_to_be_assigned.karma
	karma_level = class_to_be_assigned.karma_level
	
	print(player_class, " = Player class", health, " = Maximum health", damage, " = Damage", stamina, " = Stamina", karma, " = Karma", karma_level, " = Karma Level")

