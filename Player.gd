extends Area2D

## Signals
signal new_position(current_position)

## Related to players position
var previous_position = Vector2(0, 0)
var step_size: int = 25

## Player sprite paths

var mage_sprite = load("res://character/Mage/Mage overworld.png")
var paladin_sprite = load("res://character/Paladin/Paladin overworld.png")
var performer_sprite = load("res://character/Performer/Performer overworld.png")
var warrior_sprite = load("res://character/Warrior/Warrior overworld.png")
var acolyte_sprite = load("res://character/Acolyte/Acolyte overworld.png")

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
	# Assign sprite based off of player class
	match PlayerVariables.player_class:
		"Mage":
			$Sprite2D.set_texture(PlayerVariables.mage_overworld_sprite)
		"Paladin":
			$Sprite2D.set_texture(PlayerVariables.paladin_overworld_sprite)
		"Performer":
			$Sprite2D.set_texture(PlayerVariables.performer_overworld_sprite)
		"Warrior":
			$Sprite2D.set_texture(PlayerVariables.warrior_overworld_sprite)
		"Acolyte":
			$Sprite2D.set_texture(PlayerVariables.acolyte_overworld_sprite)
		

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
