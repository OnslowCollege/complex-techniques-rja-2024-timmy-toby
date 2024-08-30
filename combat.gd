extends Control

## Combat specific variables
var next_level
var combat_state

## Fake stat blocks
# Enemy
var max_enemy_health: int
var current_enemy_health: int
var enemy_damage: int
var enemy_moveset: Array

# Player
var max_health: int
var current_health: int
var damage: int
var stamina: int
var moveset: Array

var karma: int
var karma_level: int


## Mockup enemy


## Signals
signal exit_victory_screen
signal textbox_closed

## Combat functionality
enum COMBAT_STATES {
	START,
	PLAYER,
	ENEMY,
	WIN,
	LOSE,
}

func _input(event):
	if (Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and $MarginContainer/Dialoguebox.visible:
			$MarginContainer/Dialoguebox.hide()
			textbox_closed.emit()


# Called when the node enters the scene tree for the first time.
func _ready():
	combat_state = COMBAT_STATES.START
	
	
	## Mockup enemy
	
	max_enemy_health = 50
	current_enemy_health = 50
	enemy_damage = 12
	enemy_moveset = []
	
	## Mockup player
	
	max_health = 100
	current_health = 100
	damage = 25
	stamina = 20
	moveset = []
	
	karma = 0
	karma_level = 0
	
	on_hit("Initialize", 0, "Initialize")
	_handle_combat(COMBAT_STATES.START)


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
	$ActionPanel.hide()
	_handle_combat(COMBAT_STATES.ENEMY)

func _on_act_2_pressed():
	
	$ActionPanel.hide()
	_handle_combat(COMBAT_STATES.ENEMY)

func _on_act_3_pressed():
	
	$ActionPanel.hide()
	_handle_combat(COMBAT_STATES.ENEMY)

func _on_act_4_pressed():
	
	$ActionPanel.hide()
	_handle_combat(COMBAT_STATES.ENEMY)

func on_hit(target, damage, source):
	match target:
		"Initialize": # Initial, sets the healthbar
			# Changing the player healthbar to appropriate values
			$PlayerPanel/PlayerMargin/PlayerDataHbox/Playerhealthbar.max_value = max_health
			$PlayerPanel/PlayerMargin/PlayerDataHbox/Playerhealthbar.value = current_health
			$PlayerPanel/PlayerMargin/PlayerDataHbox/Playerhealthbar/Playerlabel.text = "HP: %s/%s" % [current_health, max_health]
			
			# Changing the enemies healthbar to appropriate values
			$EnemyContainer/EnemyHealthbar.max_value = max_enemy_health
			$EnemyContainer/EnemyHealthbar.value = current_enemy_health
			$EnemyContainer/EnemyHealthbar/EnemyLabel.text = "HP: %s/%s" % [current_enemy_health, max_enemy_health]
		"Player": # Called during enemies turn
			pass
		"Enemy": # Called during players turn
			pass

func _handle_combat(new_combat_state):
	# Handle combat is used to chage states between turns, so new combat state will equal combat state.
	combat_state = new_combat_state
	
	match combat_state:
		COMBAT_STATES.START:
			print(CombatVariables.bosses_killed, "onready")
			
			## Combat functionality
			$MarginContainer/Dialoguebox.hide()
			$ActionPanel.hide()
			
			display_text("IS THAT THE JENSEN ACKLES???")
			await textbox_closed
			$ActionPanel.show()
		COMBAT_STATES.PLAYER:
			on_player_turn()
		COMBAT_STATES.ENEMY:
			on_enemy_turn()
		COMBAT_STATES.WIN:
			on_win() # Probably redundant
		COMBAT_STATES.LOSE:
			on_lose() # Probably redundant

func on_player_turn():
	$ActionPanel.show()
	
	match current_enemy_health:
		0:
			_handle_combat(COMBAT_STATES.WIN)
		_:
			_handle_combat(COMBAT_STATES.ENEMY)

func on_enemy_turn():
	
	match current_health:
		0:
			_handle_combat(COMBAT_STATES.LOSE)
		_:
			_handle_combat(COMBAT_STATES.PLAYER)

func on_win():
	pass

func on_lose():
	pass




