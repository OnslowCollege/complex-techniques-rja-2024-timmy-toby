extends Node

## Global storage for variables related to player statistics
## Conviniently, able to be called as if it was a normal variable yippee!!!!!.

## Load class sprites

var mage_overworld_sprite = load("res://character/Mage/Mage overworld.png")
var mage_combat_sprite = load("res://character/Mage/Mage back_view.png")

var paladin_overworld_sprite = load("res://character/Paladin/Paladin overworld.png")
var paladin_combat_sprite = load("res://character/Paladin/Paladin back_view.png")

var performer_overworld_sprite = load("res://character/Performer/Performer overworld.png")
var performer_combat_sprite = load("res://character/Performer/Performer back_view.png")

var warrior_overworld_sprite = load("res://character/Warrior/Warrior overworld.png")
var warrior_combat_sprite = load("res://character/Warrior/Warrior back_view.png")

var acolyte_overworld_sprite = load("res://character/Acolyte/Acolyte overworld.png")
var acolyte_combat_sprite = load("res://character/Acolyte/Acolyte back_view.png")

# Actual variables
var player_class: String

var max_health: int
var current_health: int
var damage: int
var stamina: int
var moveset: Array

var karma: int
var karma_level: int

var mage_class: class_stat_block
var paladin_class: class_stat_block
var performer_class: class_stat_block
var warrior_class: class_stat_block
var acolyte_class: class_stat_block


# Stats are held in an array before assignment to the classes themselves.
const mage_stats: Array = [
	"Mage", # player_class
	1000, # max_health
	25, # damage
	20, # stamina
	[], # moveset
	0, # karma
	0, # karma_level
	20, # test
]

const paladin_stats: Array = [
	"Paladin", # player_class
	10, # max_health
	25, # damage
	20, # stamina
	[], # moveset
	0, # karma
	0, # karma_level
	20, # test
]

const performer_stats: Array = [
	"Performer", # player_class
	100, # max_health
	25, # damage
	20, # stamina
	[], # moveset
	0, # karma
	0, # karma_level
	20, # test
]

const warrior_stats: Array = [
	"Warrior", # player_class
	100, # max_health
	25, # damage
	20, # stamina
	[], # moveset
	0, # karma
	0, # karma_level
	20, # test
]

const acolyte_stats: Array = [
	"Acolyte", # player_class
	100, # max_health
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
	"max_health",
	"damage",
	"stamina",
	"moveset",
	"karma",
	"karma_level",
	"test",
]

## Class stat block

class class_stat_block: # Funny name lol
	var player_class: String
	
	var max_health: int
	var damage: int
	var stamina: int
	var moveset: Array
	
	var karma: int
	var karma_level: int
	var test

func _ready():
	# Instancing class objects
	mage_class = class_stat_block.new()
	paladin_class = class_stat_block.new()
	performer_class = class_stat_block.new()
	warrior_class = class_stat_block.new()
	acolyte_class = class_stat_block.new()

## Class assignment function
func Assign_class(chosen_class):
	for i in chosen_class.size():
		match chosen_class[0]:
			"Mage":
				print("Reached", i)
				print(property_key[i])
				print(mage_stats[i])
				mage_class.set(property_key[i], mage_stats[i])
			"Paladin":
				print("Reached", i)
				paladin_class.set(property_key[i], paladin_stats[i])
			"Performer":
				print("Reached", i)
				performer_class.set(property_key[i], performer_stats[i])
			"Warrior":
				print("Reached", i)
				warrior_class.set(property_key[i], warrior_stats[i])
			"Acolyte":
				print("Reached", i)
				acolyte_class.set(property_key[i], acolyte_stats[i])
	match chosen_class:
		mage_stats:
			print(mage_class.player_class)
			print(mage_class.test)
			print(mage_class.max_health)
			Assign_stats(mage_class)
		paladin_stats:
			Assign_stats(paladin_class)
		performer_stats:
			Assign_stats(performer_class)
		warrior_stats:
			Assign_stats(warrior_class)
		acolyte_stats:
			Assign_stats(acolyte_class)

func Assign_stats(class_to_be_assigned):
	
	print(class_to_be_assigned.player_class)
	print(class_to_be_assigned.test)
	
	player_class = class_to_be_assigned.player_class
	max_health = class_to_be_assigned.max_health
	current_health = class_to_be_assigned.max_health
	damage = class_to_be_assigned.damage
	stamina = class_to_be_assigned.stamina
	moveset = class_to_be_assigned.moveset
	karma = class_to_be_assigned.karma
	karma_level = class_to_be_assigned.karma_level
	
	
	print(player_class, " = Player class", max_health, " = Maximum max_health", damage, " = Damage", stamina, " = Stamina", karma, " = Karma", karma_level, " = Karma Level")

## Moveset class



