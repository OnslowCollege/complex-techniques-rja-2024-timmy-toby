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
	limbust_enemy = enemy.new()
	gleed_enemy = enemy.new()
	wreresy_enemy = enemy.new()
	vraud_enemy = enemy.new()
	treachery_enemy = enemy.new()
	
	minos_boss = boss.new()
	shewolf_boss = boss.new()
	cerberus_boss = boss.new()
	minotaur_boss = boss.new()
	geryon_boss = boss.new()
	lucifer_boss = boss.new()
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
	shewolf_boss.Set_properties("King Minos", 200, 50, gen_enemy_moveset)
	cerberus_boss.Set_properties("King Minos", 200, 50, gen_enemy_moveset)
	minotaur_boss.Set_properties("King Minos", 200, 50, gen_enemy_moveset)
	geryon_boss.Set_properties("King Minos", 200, 50, gen_enemy_moveset)
	lucifer_boss.Set_properties("King Minos", 200, 50, gen_enemy_moveset)
	# And boss effects
	minos_boss.Set_boss_effect(gen_boss_effect)
	shewolf_boss.Set_boss_effect(gen_boss_effect)
	cerberus_boss.Set_boss_effect(gen_boss_effect)
	minotaur_boss.Set_boss_effect(gen_boss_effect)
	geryon_boss.Set_boss_effect(gen_boss_effect)
	lucifer_boss.Set_boss_effect(gen_boss_effect)

func Choose_enemy(enemy_to_fight):
	match enemy_to_fight:
		"limbust_enemy":
			current_enemy = limbust_enemy
		"gleed_enemy":
			current_enemy = gleed_enemy
		"minos_boss":
			current_enemy = minos_boss
		"shewolf_boss":
			current_enemy = shewolf_boss
