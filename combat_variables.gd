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

# Classes to be instanced
var limbust_enemy: Object
var gleed_enemy: Object
var wreresy_enemy: Object
var vraud_enemy: Object
var treachery_enemy: Object

var minos_boss: Object
var shewolf_boss: Object
var cerberus_boss: Object
var minotaur_boss: Object
var geryon_boss: Object
var lucicer_boss: Object

# Enemy stats
const limbust_enemy_stats: Array = [
	# enemy_name
	# max_eney_health
	# enemy_damage
	# enemy_moveset
]

const gleed_enemy_stats: Array = [
	# enemy_name
	# max_eney_health
	# enemy_damage
	# enemy_moveset
]

const wreresy_enemy_stats: Array = [
	# enemy_name
	# max_eney_health
	# enemy_damage
	# enemy_moveset
]

const vraud_enemy_stats: Array = [
	# enemy_name
	# max_eney_health
	# enemy_damage
	# enemy_moveset
]

const treachery_enemy_stats: Array = [
	# enemy_name
	# max_eney_health
	# enemy_damage
	# enemy_moveset
]

# Boss stats
const minos_boss_stats: Array = [
	# boss_name
	# max_boss_health
	# boss_damage
	# boss_moveset
	# boss_effect
]

const shewolf_boss_stats: Array = [
	# boss_name
	# max_boss_health
	# boss_damage
	# boss_moveset
	# boss_effect
]

const cerberus_boss_stats: Array = [
	# boss_name
	# max_boss_health
	# boss_damage
	# boss_moveset
	# boss_effect
]

const geryon_boss_stats: Array = [
	# boss_name
	# max_boss_health
	# boss_damage
	# boss_moveset
	# boss_effect
]

const lucifer_boss_stats: Array = [
	# boss_name
	# max_boss_health
	# boss_damage
	# boss_moveset
	# boss_effect
]

const enemy_property_key: Array = [
	"enemy_name",
	"max_enemy_health",
	"enemy_damage",
	"enemy_moveset",
]

const boss_property_key: Array = [
	"boss_name",
	"max_boss_health",
	"boss_damage",
	"boss_moveset",
	"boss_effect",
]

## Basic enemy class
class enemy: 
	var enemy_name
	
	var max_enemy_health
	var enemy_damage
	
	var enemy_moveset

## Boss class
class boss:
	var boss_name
	
	var max_boss_health
	var boss_damage
	
	var boss_moveset
	var boss_effect

func _ready():
	limbust_enemy = enemy.new()
	gleed_enemy = enemy.new()
	wreresy_enemy = enemy.new()
	vraud_enemy = enemy.new()
	treachery_enemy = enemy.new()

func Assign_enemy(encountered_enemy):
	for i in encountered_enemy.size():
		match encountered_enemy[0]:
			"Limbust sinner":
				limbust_enemy.set(enemy_property_key[i], limbust_enemy_stats[i])
			"Gleed sinner":
				gleed_enemy.set(enemy_property_key[i], gleed_enemy_stats)
			"Wreresy sinner":
				wreresy_enemy.set(enemy_property_key[i], wreresy_enemy_stats[i])
			"Vraud sinner":
				vraud_enemy.set(enemy_property_key[i], vraud_enemy_stats[i])
			"Treachery sinner":
				treachery_enemy.set(enemy_property_key[i], treachery_enemy_stats)
	match encountered_enemy[0]:
		"Limbust sinner":
			pass
		"Gleed sinner":
			pass
		"Wreresy sinner":
			pass
		"Vraud sinner":
			pass
		"Treachery sinner":
			pass

func Assign_boss(encountered_boss):
	for i in encountered_boss,size():
		match encountered_boss[0]:
			"King Minos":
				minos_boss.set(boss_property_key[i], minos_boss_stats[i])
			"She-wolf":
				
