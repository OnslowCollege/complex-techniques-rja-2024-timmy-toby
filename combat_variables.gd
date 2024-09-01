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

# Classes to be instanced
var limbust_enemy: enemy
var gleed_enemy: enemy
var wreresy_enemy: enemy
var vraud_enemy: enemy
var treachery_enemy: enemy

var minos_boss: boss
var shewolf_boss: boss
var cerberus_boss: boss
var minotaur_boss: boss
var geryon_boss: boss
var lucifer_boss: boss

# Loading boss sprites

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

# Enemy stats
const limbust_enemy_stats: Array = [
	"Limbust sinner", # enemy_name
	50, # max_enemy_health
	12, # enemy_damage
	[] # enemy_moveset
]

const gleed_enemy_stats: Array = [
	"Gleed sinner", # enemy_name
	50, # max_enemy_health
	12, # enemy_damage
	[] # enemy_moveset
]

const wreresy_enemy_stats: Array = [
	"Wreresy sinner", # enemy_name
	50, # max_enemy_health
	12, # enemy_damage
	[] # enemy_moveset
]

const vraud_enemy_stats: Array = [
	"Vraud sinner", # enemy_name
	50, # max_enemy_health
	12, # enemy_damage
	[] # enemy_moveset
]

const treachery_enemy_stats: Array = [
	"Treachery sinner", # enemy_name
	50, # max_enemy_health
	12, # enemy_damage
	[] # enemy_moveset
]

# Boss stats
const minos_boss_stats: Array = [
	"King Minos", # boss_name
	200, # max_boss_health
	25, # boss_damage
	[], # boss_moveset
	# placeholder_effect # boss_effect
]

const shewolf_boss_stats: Array = [
	"She-wolf", # boss_name
	150, # max_boss_health
	25, # boss_damage
	[], # boss_moveset
	# placeholder_effect # boss_effect
]

const cerberus_boss_stats: Array = [
	"Cerberus", # boss_name
	200, # max_boss_health
	25, # boss_damage
	[], # boss_moveset
	# placeholder_effect # boss_effect
]

const minotaur_boss_stats: Array = [
	"Minotaur", # boss_name
	200, # max_boss_health
	25, # boss_damage
	[], # boss_moveset
	# placeholder_effect # boss_effect
]

const geryon_boss_stats: Array = [
	"Geryon", # boss_name
	200, # max_boss_health
	25, # boss_damage
	[], # boss_moveset
	# placeholder_effect # boss_effect
]

const lucifer_boss_stats: Array = [
	"Lucifer", # boss_name
	200, # max_boss_health
	25, # boss_damage
	[], # boss_moveset
	# placeholder_effect # boss_effect
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
	
	minos_boss = boss.new()
	shewolf_boss = boss.new()
	cerberus_boss = boss.new()
	minotaur_boss = boss.new()
	geryon_boss = boss.new()
	lucifer_boss = boss.new()

func Assign_enemy(encountered_enemy):
	for i in encountered_enemy.size():
		match encountered_enemy[0]:
			"Limbust sinner":
				limbust_enemy.set(enemy_property_key[i], limbust_enemy_stats[i])
			"Gleed sinner":
				gleed_enemy.set(enemy_property_key[i], gleed_enemy_stats[i])
			"Wreresy sinner":
				wreresy_enemy.set(enemy_property_key[i], wreresy_enemy_stats[i])
			"Vraud sinner":
				vraud_enemy.set(enemy_property_key[i], vraud_enemy_stats[i])
			"Treachery sinner":
				treachery_enemy.set(enemy_property_key[i], treachery_enemy_stats[i])
	match encountered_enemy[0]:
		"Limbust sinner":
			Assign_stats(limbust_enemy)
		"Gleed sinner":
			Assign_stats(gleed_enemy)
		"Wreresy sinner":
			Assign_stats(wreresy_enemy)
		"Vraud sinner":
			Assign_stats(vraud_enemy)
		"Treachery sinner":
			Assign_stats(treachery_enemy)

func Assign_boss(encountered_boss):
	for i in encountered_boss.size():
		match encountered_boss:
			minos_boss_stats:
				print(boss_property_key[i])
				print(minos_boss_stats[i])
				minos_boss.set(boss_property_key[i], minos_boss_stats[i])
			shewolf_boss_stats:
				shewolf_boss.set(boss_property_key[i], shewolf_boss_stats[i])
			cerberus_boss_stats:
				cerberus_boss.set(boss_property_key[i], cerberus_boss_stats[i])
			minotaur_boss_stats:
				minotaur_boss.set(boss_property_key[i], minotaur_boss_stats[i])
			geryon_boss_stats:
				geryon_boss.set(boss_property_key[i], geryon_boss_stats[i])
			lucifer_boss_stats:
				lucifer_boss.set(boss_property_key[i], lucifer_boss_stats[i])
	match encountered_boss[0]:
			"King Minos":
				Assign_stats(minos_boss)
			"She-wolf":
				Assign_stats(shewolf_boss)
			"Cerberus":
				Assign_stats(cerberus_boss)
			"Minotaur":
				Assign_stats(minotaur_boss)
			"Geryon":
				Assign_stats(geryon_boss)
			"Lucifer":
				Assign_stats(lucifer_boss)

func Assign_stats(enemy_to_be_assigned):
	# Def can be merged into being one function shared 
	match enemy_or_boss:
		"Enemy":
			enemy_name = enemy_to_be_assigned.enemy_name
			max_enemy_health = enemy_to_be_assigned.max_enemy_health
			current_enemy_health = enemy_to_be_assigned.max_enemy_health
			enemy_damage = enemy_to_be_assigned.enemy_damage
			enemy_moveset = enemy_to_be_assigned.enemy_moveset
		"Boss":
			enemy_name = enemy_to_be_assigned.boss_name
			max_enemy_health = enemy_to_be_assigned.max_boss_health
			current_enemy_health = enemy_to_be_assigned.max_boss_health
			enemy_damage = enemy_to_be_assigned.boss_damage
			enemy_moveset = enemy_to_be_assigned.boss_moveset
			boss_effect = enemy_to_be_assigned.boss_effect
	
