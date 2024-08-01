extends Area2D

signal new_position(current_position)

var previous_position = [0, 0]
@export var current_position = [0, 0]
@export var step_size: int = 25


func _on_floor_0_give_start_coords(starting_coords_global):
	print(starting_coords_global)
	previous_position = starting_coords_global
	current_position = starting_coords_global
	self.position = Vector2(current_position[0], current_position[1])
	new_position.emit(current_position)

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
	
	self.position = Vector2(current_position[0], current_position[1])
	new_position.emit(current_position)


func _on_body_entered(body):
	print("Blocked")
	current_position = previous_position
	## Add some sort of exclamation??
