extends Control

## Level functionality
## Relevant to position
var current_position
var ignore_tile_effect
var next_level

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
var battle_over: bool = false
# 
# ## Path to relevant save file
# const position_save_path = "res://Game/position.save"
# const player_save_path = "res://Game/player.save" 
# const combat_save_path = "res://Game/combat.save"

## Signals
signal exit_victory_screen
signal textbox_closed

## Combat functionality

func _input(event):
	if battle_over == true:
		exit_victory_screen.emit()
	else:
		if (Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and $MarginContainer/Dialoguebox.visible:
			$MarginContainer/Dialoguebox.hide()
			textbox_closed.emit()
	await exit_victory_screen


# Called when the node enters the scene tree for the first time.
func _ready():
	## Level functionality
	
	
	print(CombatVariables.bosses_killed, "onready")
	
	## Combat functionality
	$MarginContainer/Dialoguebox.hide()
	$ActionPanel.hide()
	
	display_text("IS THAT THE JENSEN ACKLES???")
	await textbox_closed
	$ActionPanel.show()

# func sethealth(progress_bar, max_health, current_health):
# 	progress_bar.value = health
# 	progress_bar.max = current_health
# 	progress_bar.get_node("Playerhealth").text = "HP:%d%d" % [current_health, max_health]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func find_next_level():
	## Level functionality
	match CombatVariables.enemy_or_boss:
		"Boss":
			CombatVariables.bosses_killed += 1
			print(CombatVariables.bosses_killed, " Bosses killed")
			print("Boss option reached")
		"Enemy":
			pass
	match CombatVariables.bosses_killed:
		1:
			next_level = "Limbust"
		2:
			next_level = "Gleed"
			PositionVariables.current_position = Vector2(1, 1)
			PositionVariables.ignore_tile_effect = [Vector2(1, 1)]
		3:
			next_level = "Wreresy"
			PositionVariables.current_position = Vector2(1, 1)
			PositionVariables.ignore_tile_effect = [Vector2(1, 1)]
		4:
			next_level = "Vraud"
			PositionVariables.current_position = Vector2(1, 1)
			PositionVariables.ignore_tile_effect = [Vector2(1, 1)]
		5:
			next_level = "Treachery"
			PositionVariables.current_position = Vector2(1, 1)
			PositionVariables.ignore_tile_effect = [Vector2(1, 1)]
		_:
			next_level = "Missed"
	if next_level == "Limbust":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_1/Limbust.tscn")
		print("Send to ", next_level)
	elif next_level == "Gleed":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_2/Gleed.tscn")
		print("Send to ", next_level)
	elif next_level == "Wreresy":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_3/Wreresy.tscn")
		print("Send to ", next_level)
	elif next_level == "Vraud":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_4/Vraud.tscn")
		print("Send to ", next_level)
	elif next_level == "Treachery":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_5/Treachery.tscn")
		print("Send to ", next_level)
	else:
		print(next_level)


func display_text(text):
	$MarginContainer/Dialoguebox.show()
	$MarginContainer/Dialoguebox/MarginContainer/Dialogue.text = text


func _on_act_1_pressed():
	## Eventually transfer this functionality over to the eventual continue button.
	exit_victory_screen.emit()
	match CombatVariables.enemy_or_boss:
		"Boss":
			print("Boss")
			find_next_level()
		"Enemy":
			print("Enemy Find next")
			find_next_level()
