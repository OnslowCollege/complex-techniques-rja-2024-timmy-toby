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
]

const paladin_stats: Array = [
	"Paladin", # player_class
	10, # max_health
	25, # damage
	20, # stamina
	[], # moveset
	0, # karma
	0, # karma_level
]

const performer_stats: Array = [
	"Performer", # player_class
	100, # max_health
	25, # damage
	20, # stamina
	[], # moveset
	0, # karma
	0, # karma_level
]

const warrior_stats: Array = [
	"Warrior", # player_class
	100, # max_health
	25, # damage
	20, # stamina
	[], # moveset
	0, # karma
	0, # karma_level
]

const acolyte_stats: Array = [
	"Acolyte", # player_class
	100, # max_health
	25, # damage
	20, # stamina
	[], # moveset
	0, # karma
	0, # karma_level
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
	
	func setup_class(setup_player_class, setup_max_health, setup_damage, setup_stamina, setup_moveset, setup_karma, setup_karma_level):
		pass
	
	

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
	
	player_class = class_to_be_assigned.player_class
	max_health = class_to_be_assigned.max_health
	current_health = class_to_be_assigned.max_health
	damage = class_to_be_assigned.damage
	stamina = class_to_be_assigned.stamina
	moveset = class_to_be_assigned.moveset
	karma = class_to_be_assigned.karma
	karma_level = class_to_be_assigned.karma_level
	
	
	print(player_class, " = Player class", max_health, " = Maximum max_health", damage, " = Damage", stamina, " = Stamina", karma, " = Karma", karma_level, " = Karma Level")

## Moveset class instances

var m_attack_1: moveset_stat_block
var m_attack_2: moveset_stat_block
var m_attack_3: moveset_stat_block
var m_attack_4: moveset_stat_block

var pa_attack_1: moveset_stat_block
var pa_attack_2: moveset_stat_block
var pa_attack_3: moveset_stat_block
var pa_attack_4: moveset_stat_block

var pe_attack_1: moveset_stat_block
var pe_attack_2: moveset_stat_block
var pe_attack_3: moveset_stat_block
var pe_attack_4: moveset_stat_block

var w_attack_1: moveset_stat_block
var w_attack_2: moveset_stat_block
var w_attack_3: moveset_stat_block
var w_attack_4: moveset_stat_block

var a_attack_1: moveset_stat_block
var a_attack_2: moveset_stat_block
var a_attack_3: moveset_stat_block
var a_attack_4: moveset_stat_block

## 2d list of each class:es movement stat

const m_attack_stats: Array = [
	# 2nd dimension lists: attack_name, 
	["Fireball", 200, 100, false],
	["Fireball", 200, 100, false],
	["Fireball", 200, 100, false],
	["Fireball", 200, 100, false],
]

const pa_attack_stats: Array = [
	["Sword swing", 200, 100, false],
	["Sword swing", 200, 100, false],
	["Sword swing", 200, 100, false],
	["Sword swing", 200, 100, false],
]

const pe_attack_stats: Array = [
	["Striptease", 200, 100, false],
	["Striptease", 200, 100, false],
	["Striptease", 200, 100, false],
	["Striptease", 200, 100, false],
]

const w_attack_stats: Array = [
	["Kills you", 100000, 100, false],
	["Kills you", 100000, 100, false],
	["Kills you", 100000, 100, false],
	["Kills you", 100000, 100, false],
]

const a_attack_stats: Array = [
	["Holy water spray", 10, 100, false],
	["Holy water spray", 10, 100, false],
	["Holy water spray", 10, 100, false],
	["Holy water spray", 10, 100, false],
]

## Moveset class

class moveset_stat_block:
	var attack_name: String # Name of the attack
	
	var motion_value: int # Percent modification of the base damage
	var accuracy: int # Percent chance that the attack will hit 0%-100%
	
	var is_delayed: bool # If true, activates the delay 
	
	
	func set_properties(attack_name_stat: String, motion_stat: int, accuracy_stat: int, is_delayed_stat: bool):
		attack_name = attack_name_stat
		motion_value = motion_stat
		accuracy = accuracy_stat
		is_delayed = is_delayed_stat
	
	func set_attack():
		pass

##
