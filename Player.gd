extends CharacterBody2D

## Credit to Coding Quests

## Find way to set position based off of tilemap coordinates
@export var current_position = [0, 0]
@export var step_size: int = 25

func _on_limbust_floor_give_start_coords(starting_coords_global):
	## Testing
	print("For player " ,starting_coords_global, " is starting position")
	current_position = starting_coords_global
	## TEsting
	print(current_position)

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("step_up"):
		current_position[1] -= step_size
	if event.is_action_pressed("step_down"):
		current_position[1] += step_size
	if event.is_action_pressed("step_right"):
		current_position[0] += step_size
	if event.is_action_pressed("step_left"):
		current_position[0] -= step_size
	
	self.position = Vector2(current_position[0], current_position[1])

