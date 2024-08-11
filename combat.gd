extends Control

## This node is so ephemeral, I just need a way to move between levels so I can implement them

## Relevant to position
var current_position

## Related to players saved stats
var player_class: String
var health: int
var stamina: int
var karma: int
var karma_level: int # to help id the level the player should be returned to.

## Related to combat
var enemy_or_boss: String # ID's the tile so an enemy or boss object can be used
var bosses_killed: int # Used for iding current level, since not all levels have one boss on them

## Path to relevant save file
const position_save_path = "res://Game/position.save"
const player_save_path = "res://Game/player.save" 
const combat_save_path = "res://Game/combat.save"

signal exit_victory_screen

func _input(event):
	if Input.is_anything_pressed() == true:
		exit_victory_screen.emit()
	await exit_victory_screen
	match enemy_or_boss:
		"Boss":
			print("Boss")
			find_next_level()
		"Enemy":
			print("Enemy")
			

# Called when the node enters the scene tree for the first time.
func _ready():
	loadcombat()
	print(bosses_killed, "onready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func find_next_level():
	match enemy_or_boss:
		"Boss":
			bosses_killed += 1
			print(bosses_killed, " Bosses killed")
			savecombat()
			match bosses_killed:
				1:
					get_tree().change_scene_to_file("res://tilemaps/floor 1/LimbustFloor.tscn")
				2:
					get_tree().change_scene_to_file("res://tilemaps/floor 2/GleedFloor.tscn")
		"Enemy": 
			match bosses_killed:
				1: # Conviniently, you can't fight any enemies before killing at least one boss
					get_tree().change_scene_to_file("res://tilemaps/floor 1/LimbustFloor.tscn")
				2:
					get_tree().change_scene_to_file("res://tilemaps/floor 2/GleedFloor.tscn")

func saveplayer():
	var file = FileAccess.open(player_save_path, FileAccess.WRITE)
	file.store_var(player_class)
	file.store_var(health)
	file.store_var(stamina)
	file.store_var(karma)
	file.store_var(karma_level)

func loadplayer():
	if FileAccess.file_exists(player_save_path):
		var file = FileAccess.open(player_save_path, FileAccess.READ)
		
		player_class = file.get_var()
		print(player_class, " is the player class")
		health = file.get_var()
		print(health, " is the player's health")
		stamina = file.get_var()
		print(stamina, " is the players stamina")
		karma = file.get_var()
		print(karma, " is the players karma")
		karma_level = file.get_var()
		print(karma_level, " is the players karma level")
	else:
		print("No such file")

func savecombat():
	var file = FileAccess.open(combat_save_path, FileAccess.WRITE)
	file.store_var(enemy_or_boss)
	file.store_var(bosses_killed)

func loadcombat():
	if FileAccess.file_exists(combat_save_path):
		var file = FileAccess.open(combat_save_path, FileAccess.READ)
		enemy_or_boss = file.get_var()
		bosses_killed = file.get_var()

## Check relevance?
func saveposition():
	var file = FileAccess.open(position_save_path, FileAccess.WRITE)
	file.store_var(current_position)

func loadposition():
	if FileAccess.file_exists(position_save_path):
		var file = FileAccess.open(position_save_path, FileAccess.READ)
		current_position = file.get_var()

