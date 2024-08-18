extends Area2D

## Signals
signal new_position(current_position)

## Related to players position
var previous_position = Vector2(0, 0)
@export var current_position = Vector2(0, 0)
@export var step_size: int = 25
var ignore_tile_effect: Array = [Vector2(1, 1)] # Keeps player from using tiles they've already been on

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


func _on_floor_0_give_start_coords(starting_coords_global):
	loadposition()
	if current_position == Vector2(1, 1):
		print(starting_coords_global)
		previous_position = starting_coords_global
		current_position = starting_coords_global
		new_position.emit(current_position)
		
		current_position = starting_coords_global
	else:
		pass

	self.position = Vector2(current_position[0], current_position[1])

func _ready():
	saveposition()
	loadplayer() # initial loading upon scene startup
	loadcombat()

## Credit to Coding Quests
func _input(event):
	previous_position = current_position
	if event.is_action_pressed("step_up"):
		print("Up")
		current_position[1] -= step_size
	if event.is_action_pressed("step_down"):
		print("Down")
		current_position[1] += step_size
	if event.is_action_pressed("step_right"):
		print("Left")
		current_position[0] += step_size
	if event.is_action_pressed("step_left"):
		print("Right")
		current_position[0] -= step_size
	
	new_position.emit(current_position)
	self.position = Vector2(current_position[0], current_position[1])
	print(self.position)
	saveposition()


func _on_body_entered(body):
	print("Blocked")
	current_position = previous_position
	## Add some sort of exclamation??


func _on_floor_0_position_information(moveOptions, currentTileType):
	## Parses the string output of the signal
	
	match currentTileType:
		"Start":
			pass
		"Bonfire":
			print("Restore health")
		"Lore":
			print("yap yap yap")
		"Enemy":
			if current_position in ignore_tile_effect:
				print("Ignore")
			else:
				ignore_tile_effect.append(current_position)
				enemy_or_boss = currentTileType
				saveposition()
				savecombat()
				print("Fight!!!")
				get_tree().change_scene_to_file("res://combat.tscn")
				
		"Boss":
			if current_position in ignore_tile_effect:
				print("Ignore")
			else:
				ignore_tile_effect.append(current_position)
				enemy_or_boss = currentTileType
				saveposition()
				savecombat()
				print("Fight!!!")
				get_tree().change_scene_to_file("res://combat.tscn")
		_:
			pass
	

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
