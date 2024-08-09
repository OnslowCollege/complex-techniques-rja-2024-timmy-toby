extends Area2D

# Sends current position to relevant floor
signal new_position(current_position)

# Related to positioning the player
var previous_position = Vector2(0, 0)
@export var current_position = Vector2(0, 0)
@export var step_size: int = 25

# Related to players saved stats
var player_class: String
var health: int
var stamina: int
var karma: int
var karma_level: int
var current_level: String

# Path to relevant save file
const save_path = "res://Game/player.save" 


func _on_floor_0_give_start_coords(starting_coords_global):
	print(starting_coords_global)
	previous_position = starting_coords_global
	current_position = starting_coords_global
	new_position.emit(current_position)
	
	loadfile() # initial loading upon scene startup
	self.position = Vector2(current_position[0], current_position[1])

func _ready():
	pass

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
	
	new_position.emit(current_level)
	self.position = Vector2(current_position[0], current_position[1])
	save()


func _on_body_entered(body):
	print("Blocked")
	current_position = previous_position
	## Add some sort of exclamation??


func _on_floor_0_position_information(moveOptions, currentTileType):
	## Parses the string output of the signal
	
	match currentTileType:
		"Bonfire":
			print("Restore health")
		"Lore":
			print("yap yap yap")
		"Enemy":
			print("Fight!!!")
		"Boss":
			print("Fight!!!")
		_:
			pass
	

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(current_position)
	file.store_var(current_level)
	file.store_var(player_class)
	file.store_var(health)
	file.store_var(stamina)
	file.store_var(karma)
	file.store_var(karma_level)

func loadfile():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		
		current_position = file.get_var()
		print(current_position, " is the current position")
		current_level = file.get_var()
		print(current_level, " is the currnent level")
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
