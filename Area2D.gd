extends Area2D

## Credit to Coding Quests

## Find way to set position based off of tilemap coordinates
@export var current_position = [0, 0]
@export var step_size: int = 25

func _on_floor_0_give_start_coords(starting_coords_global):
	print(starting_coords_global)
	current_position = starting_coords_global

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("step_up"):
		current_position[1] -= step_size
		## Testing
	if event.is_action_pressed("step_down"):
		current_position[1] += step_size
	if event.is_action_pressed("step_right"):
		current_position[0] += step_size
	if event.is_action_pressed("step_left"):
		current_position[0] -= step_size
	
	print(overlaps_body(Wall_1))
	
	self.position = Vector2(current_position[0], current_position[1])




