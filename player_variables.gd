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
	paladin_atk3,
	paladin_atk4
]

var performer_atk_list: Array = [
	performer_atk1,
	performer_atk2,
	performer_atk3,
	performer_atk4
]

var warrior_atk_list: Array = [
	warrior_atk1,
	warrior_atk2,
	warrior_atk3,
	warrior_atk4,
]

var acolyte_atk_list: Array = [
	acolyte_atk1,
	acolyte_atk2,
	acolyte_atk3,
	acolyte_atk4,
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
	mage_class.Set_properties("Mage", 100, 50, 20, mage_atk_list, 0, 0)
	paladin_class.Set_properties("Paladin", 200, 25, 20, paladin_atk_list, 0, 0)
	performer_class.Set_properties("Performer", 100, 25, 20, performer_atk_list, 0, 0)
	warrior_class.Set_properties("Warrior", 150, 30, 25, warrior_atk_list, 0, 0)
	acolyte_class.Set_properties("Acolyte", 125, 25, 20, acolyte_atk_list, 20, 1)

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
	var is_block_key: bool # If true, will negate the next attack by the player damage value
	
	
	func Set_properties(name: String, value: int, accuracy: int, is_delayed: bool, is_block: bool):
		attack_name = attack_name
		motion_value = motion_value
		accuracy_value = accuracy
		is_delayed_key = is_delayed
		is_block_key = is_block

## Assigning stats to each object

func Set_attack_properties():
	mage_atk1.Set_properties("Balefire", 100, 100, false, false) # Normal attack, ineffcient ideally
	mage_atk2.Set_properties("Heretical storm", 100, 100, false, false) # High accuracy attack
	mage_atk3.Set_properties("Pagan's curse", 100, 100, true, false) # Strong attack, delayed
	mage_atk4.Set_properties("Arcane barrier", 100, 100, false, true) # Blocking attack
	
	paladin_atk1.Set_properties("Great slash", 100, 100, false, false)
	paladin_atk1.Set_properties("Testing jab", 100, 100, false, false)
	paladin_atk1.Set_properties("By His sword", 100, 100, true, false)
	paladin_atk1.Set_properties("By His shield", 100, 100, false, true)
	
	performer_atk1.Set_properties("Lute strike", 100, 100, false, false)
	performer_atk1.Set_properties("Gale-step kick", 100, 100, false, false)
	performer_atk1.Set_properties("Rending tune", 100, 100, true, false)
	performer_atk1.Set_properties("Prayer in C major", 100, 100, false, true)
	
	warrior_atk1.Set_properties("Cut", 100, 100, false, false)
	warrior_atk1.Set_properties("Swift feint", 100, 100, false, false)
	warrior_atk1.Set_properties("Skullsplitter", 100, 100, true, false)
	warrior_atk1.Set_properties("A Pagan's vitality", 100, 100, false, true)
	
	acolyte_atk1.Set_properties("Prayerful strike", 100, 100, false, false)
	acolyte_atk1.Set_properties("Holy Utterance", 100, 100, false, false)
	acolyte_atk1.Set_properties("His Light", 100, 100, true, false)
	acolyte_atk1.Set_properties("Destined protection", 100, 100, false, true)
