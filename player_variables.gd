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

# Stat variables to be modified, kept in this form so I don't have to call a property of a property in the combat and player scenes.

var current_class: Object # Assigned in the _ready() method

var player_class: String

var max_health: int
var current_health: int
var damage: int
var stamina: int

var moveset: Array

var karma: int
var karma_level: int

# Variables for the class instances themselves.

var mage_class: class_stat_block = class_stat_block.new()
var paladin_class: class_stat_block = class_stat_block.new()
var performer_class: class_stat_block = class_stat_block.new()
var warrior_class: class_stat_block = class_stat_block.new()
var acolyte_class: class_stat_block = class_stat_block.new()

## Instancing Attack objects

var mage_atk1: Attack_stat_block = Attack_stat_block.new()
var mage_atk2: Attack_stat_block = Attack_stat_block.new()
var mage_atk3: Attack_stat_block = Attack_stat_block.new()
var mage_atk4: Attack_stat_block = Attack_stat_block.new()

var paladin_atk1: Attack_stat_block = Attack_stat_block.new()
var paladin_atk2: Attack_stat_block = Attack_stat_block.new()
var paladin_atk3: Attack_stat_block = Attack_stat_block.new()
var paladin_atk4: Attack_stat_block = Attack_stat_block.new()

var performer_atk1: Attack_stat_block = Attack_stat_block.new()
var performer_atk2: Attack_stat_block = Attack_stat_block.new()
var performer_atk3: Attack_stat_block = Attack_stat_block.new()
var performer_atk4: Attack_stat_block = Attack_stat_block.new()

var warrior_atk1: Attack_stat_block = Attack_stat_block.new()
var warrior_atk2: Attack_stat_block = Attack_stat_block.new()
var warrior_atk3: Attack_stat_block = Attack_stat_block.new()
var warrior_atk4: Attack_stat_block = Attack_stat_block.new()

var acolyte_atk1: Attack_stat_block = Attack_stat_block.new()
var acolyte_atk2: Attack_stat_block = Attack_stat_block.new()
var acolyte_atk3: Attack_stat_block = Attack_stat_block.new()
var acolyte_atk4: Attack_stat_block = Attack_stat_block.new()

## Assigning Attack objects into arrays for easy access and easy parameter inputs

var mage_atk_list: Array = [
	mage_atk1,
	mage_atk2,
	mage_atk3,
	mage_atk4
]

var paladin_atk_list: Array = [
	paladin_atk1,
	paladin_atk2,
]

## Class stat block

class class_stat_block: # Funny name lol
	var player_class: String
	
	var max_health: int
	var current_health: int
	var damage: int
	var stamina: int
	var moveset: Array
	
	var karma: int
	var karma_level: int
	
	func Set_properties(player_class_name: String, player_health: int, player_damage: int, player_stamina: int, player_moveset: Array, player_karma: int, player_karma_level: int) :
		player_class = player_class_name
		max_health = player_health
		damage = player_damage
		stamina = player_stamina
		moveset = player_moveset
		karma = player_karma
		karma_level = player_karma_level

func _ready():
	Assign_classes()
	Set_attack_properties()


## Class assignment method
func Assign_classes():
	mage_class.Set_properties("Mage", 100, 25, 20, mage_atk_list, 0, 0)
	paladin_class.Set_properties("Paladin", 100, 25, 20, paladin_atk_list, 0, 0)
	# performer_class = class_stat_block.new()
	# warrior_class = class_stat_block.new()
	# acolyte_class = class_stat_block.new()

## Class choice method
func Choose_class(chosen_class: String):
	match chosen_class:
		"Mage":
			current_class = mage_class
		"Paladin":
			current_class = paladin_class
	
	player_class = current_class.player_class
	max_health = current_class.max_health
	current_health = current_class.max_health
	damage = current_class.damage
	stamina = current_class.stamina
	moveset = current_class.moveset
	karma = current_class.karma
	karma_level = current_class.karma_level

## Attack class

class Attack_stat_block:
	var attack_name: String # Name of the attack
	
	var motion_value: int # Percent modification of the base damage
	var accuracy_value: int # Percent chance that the attack will hit 0%-100%
	
	var is_delayed_key: bool # If true, activates the delay 
	
	
	func Set_properties(name: String, value: int, accuracy: int, is_delayed: bool):
		attack_name = attack_name
		motion_value = motion_value
		accuracy_value = accuracy
		is_delayed_key = is_delayed

## Assigning stats to each object

var atk_name = "Fireball"
var atk_damage = 100
var atk_accuracy = 100
var atk_delay = false

func Set_attack_properties():
	mage_atk1 = mage_atk1.Set_properties(atk_name, atk_damage, atk_accuracy, atk_delay)
	mage_atk2 = mage_atk2.Set_properties(atk_name, atk_damage, atk_accuracy, atk_delay)
	mage_atk3 = mage_atk3.Set_properties(atk_name, atk_damage, atk_accuracy, atk_delay)
	mage_atk4 = mage_atk4.Set_properties(atk_name, atk_damage, atk_accuracy, atk_delay)
