extends Node

## Global storage for variables related to the combat scene

var enemy_or_boss: String
var bosses_killed: int
var next_level

## For existing enemy instances to reference from in combat
var enemy_name: String

var max_enemy_health: int
var current_enemy_health: int
var enemy_damage: int

var enemy_moveset: Array
var boss_effect: Object

var current_enemy: Object # Carries the values for the current enemy being fought

## Enemy and boss instances
var limbust_enemy: enemy = enemy.new()
var gleed_enemy: enemy = enemy.new()
var wreresy_enemy: enemy = enemy.new()
var vraud_enemy: enemy = enemy.new()
var treachery_enemy: enemy = enemy.new()

var minos_boss: boss = boss.new()
var shewolf_boss: boss = boss.new()
var cerberus_boss: boss = boss.new()
var minotaur_boss: boss = boss.new()
var geryon_boss: boss = boss.new()
var lucifer_boss: boss = boss.new()

## Enemy attack instances

var enemy_normal_atk: Attack_stat_block = Attack_stat_block.new()

## Enemy moveset Arrays

var gen_enemy_moveset: Array = []

## Boss effect instances

var gen_boss_effect: Object

# Preloading all relevant sprites.

var minos_sprite = load("res://bosses/Minos.png")
var shewolf_sprite = load("res://bosses/She-wolf.png")
var cerberus_sprite = load("res://bosses/Cerberus.png")
var minotaur_sprite = load("res://bosses/Minotaur.png")
var geryon_sprite = load("res://bosses/Geryon.png")
var lucifer_sprite = load("res://bosses/Satan.png")

var limbust_sinner_sprite = load("res://enemies/Limbust sinner.png")
var gleed_sinner_sprite = load("res://enemies/Gleed sinner.png")
var wreresy_sinner_sprite = load("res://enemies/Wreresy sinner.png")
var vraud_sinner_sprite = load("res://enemies/Vraud sinner.png")
var treachery_sinner_sprite = load("res://enemies/Treachery sinner.png")

## Basic enemy class
class enemy: 
	var enemy_name: String
	
	var max_enemy_health: int
	var enemy_damage: int
	
	var enemy_moveset: Array
	
	func Set_properties(name: String, health: int, damage: int, moveset: Array):
		enemy_name = name
		max_enemy_health = health
		enemy_damage = damage
		enemy_moveset = moveset

## Boss class
class boss:
	extends enemy
	
	var boss_effect: Object
	
	func Set_boss_effect(effect: Object):
		boss_effect = effect

func _ready():
	Assign_stats()

func Assign_stats():
	## Enemies
	limbust_enemy.Set_properties("Limbust Sinner", 50, 10, gen_enemy_moveset)
	gleed_enemy.Set_properties("Gleed Sinner", 50, 10, gen_enemy_moveset)
	wreresy_enemy.Set_properties("Wreresy Sinner", 50, 10, gen_enemy_moveset)
	vraud_enemy.Set_properties("Vraud Sinner", 50, 10, gen_enemy_moveset)
	treachery_enemy.Set_properties("Treachery Sinner", 50, 10, gen_enemy_moveset)
	
	## Bosses
	minos_boss.Set_properties("King Minos", 200, 50, gen_enemy_moveset)
	shewolf_boss.Set_properties("The She-Wolf", 200, 50, gen_enemy_moveset)
	cerberus_boss.Set_properties("Cerberus", 200, 50, gen_enemy_moveset)
	minotaur_boss.Set_properties("The Minotaur", 200, 50, gen_enemy_moveset)
	geryon_boss.Set_properties("Geryon", 200, 50, gen_enemy_moveset)
	lucifer_boss.Set_properties("Lucifer", 200, 50, gen_enemy_moveset)
	# And boss effects
	minos_boss.Set_boss_effect(gen_boss_effect)
	shewolf_boss.Set_boss_effect(gen_boss_effect)
	cerberus_boss.Set_boss_effect(gen_boss_effect)
	minotaur_boss.Set_boss_effect(gen_boss_effect)
	geryon_boss.Set_boss_effect(gen_boss_effect)
	lucifer_boss.Set_boss_effect(gen_boss_effect)

func Choose_enemy(enemy_to_fight):
	match enemy_to_fight:
		## Enemies
		"limbust_enemy":
			current_enemy = limbust_enemy
		"gleed_enemy":
			current_enemy = gleed_enemy
		"wreresy_enemy":
			current_enemy = wreresy_enemy
		"vraud_enemy":
			current_enemy = vraud_enemy
		"treachery_enemy":
			current_enemy = treachery_enemy
		## Bosses
		"minos_boss":
			current_enemy = minos_boss
		"shewolf_boss":
			current_enemy = shewolf_boss
		"cerberus_boss":
			current_enemy = cerberus_boss
		"minotaur_boss":
			current_enemy = minotaur_boss
		"geryon_boss":
			current_enemy = geryon_boss
		"lucifer_boss":
			current_enemy = lucifer_boss
	
	enemy_name = current_enemy.enemy_name
	max_enemy_health = current_enemy.max_enemy_health
	current_enemy_health = current_enemy.max_enemy_health
	enemy_damage = current_enemy.enemy_damage
	enemy_moveset = current_enemy.enemy_moveset
	
	if enemy_or_boss == "Boss":
		boss_effect = current_enemy.boss_effect
	else:
		pass

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
	pass

class Boss_effect_block:
	# Property and two methods, one small one big
	# Property is literally just the boss name
	# First method assigns that property, second method handles the specific effects on its own.
	var boss_effect: String
	
	
	func Set_Property(boss_effect_name: String):
		boss_effect = boss_effect_name
	
	
	func Apply_boss_effect(boss_effect: String):
		# Uses a match case statement to differentiate between different boss stats
