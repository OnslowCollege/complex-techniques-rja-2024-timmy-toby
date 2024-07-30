extends Area2D

## Credit to Coding Quests

var previous_position = [0, 0]
@export var current_position = [0, 0]
@export var step_size: int = 25


func _on_floor_0_give_start_coords(starting_coords_global):
	print(starting_coords_global)
	current_position = starting_coords_global

func _ready():
	pass

func _input(event):
	previous_position = current_position
	if event.is_action_pressed("step_up"):
		current_position[1] -= step_size
	if event.is_action_pressed("step_down"):
		current_position[1] += step_size
	if event.is_action_pressed("step_right"):
		current_position[0] += step_size
	if event.is_action_pressed("step_left"):
		current_position[0] -= step_size
	
	self.position = Vector2(current_position[0], current_position[1])


func _on_body_entered(body):
	current_position = previous_position