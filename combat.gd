extends Control

## Level functionality
## Relevant to position
var current_position
var ignore_tile_effect
var next_level

## Related to players saved stats
var player_class: String
var health: int
var stamina: int
var karma: int
var karma_level: int # to help id the level the player should be returned to.

## Related to combat
var enemy_or_boss: String # ID's the tile so an enemy or boss object can be used
var bosses_killed: int # Used for iding current level, since not all levels have one boss on them
var battle_over: bool = false

## Path to relevant save file
const position_save_path = "res://Game/position.save"
const player_save_path = "res://Game/player.save" 
const combat_save_path = "res://Game/combat.save"

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
	match enemy_or_boss:
		"Boss":
			print("Boss")
			find_next_level()
		"Enemy":
			print("Enemy Find next")
			find_next_level()


# Called when the node enters the scene tree for the first time.
func _ready():
	## Level functionality
	loadcombat()
	loadposition()
	print(bosses_killed, "onready")
	
	## Combat functionality
	$MarginContainer/Dialoguebox.hide()
	$ActionPanel.hide()
	
	display_text("IS THAT THE JENSEN ACKLES???")
	await textbox_closed
	$ActionPanel.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func find_next_level():
	## Level functionality
	match enemy_or_boss:
		"Boss":
			bosses_killed += 1
			savecombat()
			print(bosses_killed, " Bosses killed")
			print("Boss option reached")
		"Enemy":
			pass
	match bosses_killed:
		1:
			next_level = "Limbust"
		2:
			next_level = "Gleed"
			current_position = Vector2(1, 1)
			ignore_tile_effect = [Vector2(1, 1)]
			saveposition()
		3:
			next_level = "Wreresy"
			current_position = Vector2(1, 1)
			ignore_tile_effect = [Vector2(1, 1)]
			saveposition()
		4:
			next_level = "Vraud"
			current_position = Vector2(1, 1)
			ignore_tile_effect = [Vector2(1, 1)]
			saveposition()
		5:
			next_level = "Treachery"
			current_position = Vector2(1, 1)
			ignore_tile_effect = [Vector2(1, 1)]
			saveposition()
		_:
			next_level = "Missed"
	if next_level == "Limbust":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor 1/Limbust.tscn")
		print("Send to ", next_level)
	elif next_level == "Gleed":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor 2/Gleed.tscn")
		print("Send to ", next_level)
	elif next_level == "Wreresy":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor 3/Wreresy.tscn")
		print("Send to ", next_level)
	elif next_level == "Vraud":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor 4/Vraud.tscn")
		print("Send to ", next_level)
	elif next_level == "Treachery":
		print(next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor 5/Treachery.tscn")
		print("Send to ", next_level)
	else:
		print(next_level)

#			print("Boss option reached")
#			bosses_killed += 1
#			print(bosses_killed, " Bosses killed")
#			savecombat()
#			match bosses_killed: ## Probably more appropriate to have these just assign to a variable for flexibility
#				1:
#					next_level = "Limbust"
#					get_tree().change_scene_to_file("res://tilemaps/floor 1/LimbustFloor.tscn")
#				2:
#					next_level = "Gleed"
#					get_tree().change_scene_to_file("res://tilemaps/floor 2/GleedFloor.tscn")
#					current_position = Vector2(1, 1)
#					ignore_tile_effect = [Vector2(1, 1)]
#					saveposition()
#				3:
#					next_level = "Vreresy"
#				4:
#					next_level = "Vraud"
#				5:
#					next_level = "Treachery"
#		"Enemy": 
#			print("Enemy option reached")
#			match bosses_killed:
#				1: # Conviniently, you can't fight any enemies before killing at least one boss
#					print("Enemy reached 1")
#					get_tree().change_scene_to_file("res://tilemaps/floor 1/LimbustFloor.tscn")
#				2:
#					print("Enemy reached 2")
#					get_tree().change_scene_to_file("res://tilemaps/floor 2/GleedFloor.tscn")
#				_:
#					print(bosses_killed)
	
	## Combat functionality

func display_text(text):
	$MarginContainer/Dialoguebox.show()
	$MarginContainer/Dialoguebox/MarginContainer/Dialogue.text = text

## Save/load functions
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


## Check relevance?
func saveposition():
	var file = FileAccess.open(position_save_path, FileAccess.WRITE)
	file.store_var(current_position)
	file.store_var(ignore_tile_effect)


func loadposition():
	if FileAccess.file_exists(position_save_path):
		var file = FileAccess.open(position_save_path, FileAccess.READ)
		current_position = file.get_var()
		ignore_tile_effect = file.get_var()


func _on_act_1_pressed():
	exit_victory_screen.emit()
