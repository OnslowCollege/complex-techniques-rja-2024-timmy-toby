extends Area2D

## Signals
signal new_position(current_position)

## Related to players position
var previous_position = Vector2(0, 0)
var step_size: int = 25

## Related to players saved stats
# var player_class: String
# var health: int
# var stamina: int
# var karma: int
# var karma_level: int # to help id the level the player should be returned to.
# 
# ## Related to combat
# var enemy_or_boss: String # ID's the tile so an enemy or boss object can be used
# var bosses_killed: int # Used for iding current level, since not all levels have one boss on them
# 
# ## Path to relevant save file
# const position_save_path = "res://Game/position.save"
# const player_save_path = "res://Game/player.save" 
# const combat_save_path = "res://Game/combat.save"


func _on_floor_0_give_start_coords(starting_coords_global):
	if PositionVariables.current_position == Vector2(1, 1):
		print(starting_coords_global)
		previous_position = starting_coords_global
		PositionVariables.current_position = starting_coords_global
		new_position.emit(PositionVariables.current_position)
		
		PositionVariables.current_position = starting_coords_global
	else:
		pass

	self.position = Vector2(PositionVariables.current_position[0], PositionVariables.current_position[1])

func _ready():
	pass

## Credit to Coding Quests
func _input(event):
	previous_position = PositionVariables.current_position
	if event.is_action_pressed("step_up"):
		print("Up")
		PositionVariables.current_position[1] -= step_size
	if event.is_action_pressed("step_down"):
		print("Down")
		PositionVariables.current_position[1] += step_size
	if event.is_action_pressed("step_right"):
		print("Left")
		PositionVariables.current_position[0] += step_size
	if event.is_action_pressed("step_left"):
		print("Right")
		PositionVariables.current_position[0] -= step_size
	
	new_position.emit(PositionVariables.current_position)
	self.position = Vector2(PositionVariables.current_position[0], PositionVariables.current_position[1])
	print(self.position)
	


func _on_body_entered(body):
	print("Blocked")
	PositionVariables.current_position = previous_position
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
			if PositionVariables.current_position in PositionVariables.ignore_tile_effect:
				print("Ignore")
			else:
				PositionVariables.ignore_tile_effect.append(PositionVariables.current_position)
				CombatVariables.enemy_or_boss = currentTileType
				
				
				print("Fight!!!")
				get_tree().change_scene_to_file("res://combat.tscn")
				
		"Boss":
			if PositionVariables.current_position in PositionVariables.ignore_tile_effect:
				print("Ignore")
			else:
				PositionVariables.ignore_tile_effect.append(PositionVariables.current_position)
				CombatVariables.enemy_or_boss = currentTileType
				
				
				print("Fight!!!")
				get_tree().change_scene_to_file("res://combat.tscn")
		_:
			pass
