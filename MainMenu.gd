extends Control

## Relevant to position
var current_position
var ignore_tile_effect

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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	print("reached")
	current_position = Vector2(1, 1)
	ignore_tile_effect = [Vector2(1, 1)]
	saveposition()
	get_tree().change_scene_to_file("res://tilemaps/floor_1/Limbust.tscn")
	bosses_killed = 0
	savecombat()
	print("Cleared")


func _on_options_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()

func savecombat():
	var file = FileAccess.open(combat_save_path, FileAccess.WRITE)
	file.store_var(enemy_or_boss)
	file.store_var(bosses_killed)


func loadcombat():
	if FileAccess.file_exists(combat_save_path):
		var file = FileAccess.open(combat_save_path, FileAccess.READ)
		enemy_or_boss = file.get_var()
		bosses_killed = file.get_var()
	else:
		print("No such file")


func saveposition():
	var file = FileAccess.open(position_save_path, FileAccess.WRITE)
	file.store_var(current_position)
	file.store_var(ignore_tile_effect)


func loadposition():
	if FileAccess.file_exists(position_save_path):
		var file = FileAccess.open(position_save_path, FileAccess.READ)
		current_position = file.get_var()
		ignore_tile_effect = file.get_var()
	else:
		print("No such file")
