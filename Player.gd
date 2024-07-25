extends CharacterBody2D

## Credit to Coding Quests

## Find way to set position based off of tilemap coordinates
@export var current_position = [0, 0]

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("step_up"):
		current_position[1] -= 16
	if event.is_action_pressed("step_down"):
		current_position[1] += 16
	if event.is_action_pressed("step_right"):
		current_position[0] += 16
	if event.is_action_pressed("step_left"):
		current_position[0] -= 16
	
	self.position = Vector2(current_position[0], current_position[1])
