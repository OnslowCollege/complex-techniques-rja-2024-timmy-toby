extends Control

## Combat specific variables
var combat_state

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
			match CombatVariables.bosses_killed:
				1:
					CombatVariables.next_level = "Limbust"
				2:
					CombatVariables.next_level = "Gleed"
					PositionVariables.current_position = Vector2(1, 1)
					PositionVariables.ignore_tile_effect = [Vector2(1, 1)]
				3:
					CombatVariables.next_level = "Wreresy"
					PositionVariables.current_position = Vector2(1, 1)
					PositionVariables.ignore_tile_effect = [Vector2(1, 1)]
				4:
					CombatVariables.next_level = "Vraud"
					PositionVariables.current_position = Vector2(1, 1)
					PositionVariables.ignore_tile_effect = [Vector2(1, 1)]
				5:
					CombatVariables.next_level = "Treachery"
					PositionVariables.current_position = Vector2(1, 1)
					PositionVariables.ignore_tile_effect = [Vector2(1, 1)]
				_:
					CombatVariables.next_level = "Missed"
		"Enemy":
			pass
	if CombatVariables.next_level == "Limbust": # I don't know why this is an if/else block
		print(CombatVariables.next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_1/Limbust.tscn")
		print("Send to ", CombatVariables.next_level)
	elif CombatVariables.next_level == "Gleed":
		print(CombatVariables.next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_2/Gleed.tscn")
		print("Send to ", CombatVariables.next_level)
	elif CombatVariables.next_level == "Wreresy":
		print(CombatVariables.next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_3/Wreresy.tscn")
		print("Send to ", CombatVariables.next_level)
	elif CombatVariables.next_level == "Vraud":
		print(CombatVariables.next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_4/Vraud.tscn")
		print("Send to ", CombatVariables.next_level)
	elif CombatVariables.next_level == "Treachery":
		print(CombatVariables.next_level)
		get_tree().change_scene_to_file("res://tilemaps/floor_5/Treachery.tscn")
		print("Send to ", CombatVariables.next_level)
	else:
		print(CombatVariables.next_level)


func display_text(text):
	$MarginContainer/Dialoguebox.show()
	$MarginContainer/Dialoguebox/MarginContainer/Dialogue.text = text


func _on_act_1_pressed():
	$ActionPanel.hide()
	on_hit("Player", PlayerVariables.damage, 1)

func _on_act_2_pressed():
	
	$ActionPanel.hide()

func _on_act_3_pressed():
	
	$ActionPanel.hide()

func _on_act_4_pressed():
	
	$ActionPanel.hide()

func _on_win_button_pressed():
	_handle_combat(COMBAT_STATES.WIN)

func on_hit(user, base_damage, source):
	## Params:
	# user = source of the health modification.
	# base_damage = amount of damage to be multiplied off of
	# source = button which the attack derived from, subtract by 1 to find the index for corresponding moveset list object.
	match user:
		"Initialize": # Initial, sets the healthbar
			# Changing the player healthbar to appropriate values
			$PlayerPanel/PlayerMargin/PlayerDataHbox/Playerhealthbar.max_value = PlayerVariables.max_health
			$PlayerPanel/PlayerMargin/PlayerDataHbox/Playerhealthbar.value = PlayerVariables.current_health
			$PlayerPanel/PlayerMargin/PlayerDataHbox/Playerhealthbar/Playerlabel.text = "HP: %s/%s" % [PlayerVariables.current_health, PlayerVariables.max_health]
			
			# Changing the enemies healthbar to appropriate values
			$EnemyContainer/EnemyHealthbar.max_value = CombatVariables.max_enemy_health
			$EnemyContainer/EnemyHealthbar.value = CombatVariables.current_enemy_health
			$EnemyContainer/EnemyHealthbar/EnemyLabel.text = "HP: %s/%s" % [CombatVariables.current_enemy_health, CombatVariables.max_enemy_health]
		"Player": ## Called during players turn
			CombatVariables.current_enemy_health -= base_damage
			
			$EnemyContainer/EnemyHealthbar.value = CombatVariables.current_enemy_health
			$EnemyContainer/EnemyHealthbar/EnemyLabel.text = "HP: %s/%s" % [CombatVariables.current_enemy_health, CombatVariables.max_enemy_health]
			_handle_combat(COMBAT_STATES.ENEMY)
		"Enemy": ## Called during enemies turn
			PlayerVariables.current_health -= base_damage
			
			$PlayerPanel/PlayerMargin/PlayerDataHbox/Playerhealthbar.value = PlayerVariables.current_health
			$PlayerPanel/PlayerMargin/PlayerDataHbox/Playerhealthbar/Playerlabel.text = "HP: %s/%s" % [PlayerVariables.current_health, PlayerVariables.max_health]
			_handle_combat(COMBAT_STATES.PLAYER)


func _handle_combat(new_combat_state):
	# Handle combat is used to chage states between turns, so new combat state will equal combat state.
	combat_state = new_combat_state
	
	match combat_state:
		COMBAT_STATES.START:
			match CombatVariables.enemy_or_boss:
				"Boss":
					find_boss()
				"Enemy":
					find_enemy()
			match CombatVariables.enemy_name: # Cant this go in _ready()?
				"King Minos":
					$EnemyContainer/Enemy.texture = CombatVariables.minos_sprite
				"The She-Wolf":
					$EnemyContainer/Enemy.texture = CombatVariables.shewolf_sprite
				"Cerberus":
					$EnemyContainer/Enemy.texture = CombatVariables.cerberus_sprite
				"The Minotaur":
					$EnemyContainer/Enemy.texture = CombatVariables.minotaur_sprite
				"Geryon":
					$EnemyContainer/Enemy.texture = CombatVariables.geryon_sprite
				"Lucifer":
					$EnemyContainer/Enemy.texture = CombatVariables.lucifer_sprite
				"Limbust Sinner":
					$EnemyContainer/Enemy.texture = CombatVariables.limbust_sinner_sprite
				"Gleed Sinner":
					$EnemyContainer/Enemy.texture = CombatVariables.gleed_sinner_sprite
				"Wreresy Sinner":
					$EnemyContainer/Enemy.texture = CombatVariables.wreresy_sinner_sprite
				"Vraud Sinner":
					$EnemyContainer/Enemy.texture = CombatVariables.vraud_sinner_sprite
				"Treachery Sinner":
					$EnemyContainer/Enemy.texture = CombatVariables.treachery_sinner_sprite
			
			# Initializes player and enemy health bars
			on_hit("Initialize", 0, "Initialize")
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
	
	match CombatVariables.current_enemy_health:
		0:
			_handle_combat(COMBAT_STATES.WIN)
		_:
			pass

func on_enemy_turn():
	await get_tree().create_timer(1).timeout
	on_hit("Enemy", CombatVariables.enemy_damage, 1)
	match PlayerVariables.current_health:
		0:
			_handle_combat(COMBAT_STATES.LOSE)
		_:
			pass

func on_win():
	match CombatVariables.enemy_or_boss:
		"Boss":
			print("Boss")
			find_next_level()
		"Enemy":
			print("Enemy Find next")
			find_next_level()

func on_lose():
	pass

func find_boss():
	# Runs when on a boss tile, figures out the specific boss you're meant to fight
	match CombatVariables.bosses_killed:
		0:
			CombatVariables.Choose_enemy("minos_boss")
		1:
			CombatVariables.Choose_enemy("shewolf_boss")
		2:
			CombatVariables.Choose_enemy("cerberus_boss")
		3:
			CombatVariables.Choose_enemy("minotaur_boss")
		4:
			CombatVariables.Choose_enemy("geryon_boss")
		5:
			CombatVariables.Choose_enemy("lucifer_boss")


func find_enemy():
	# Uses next_level, since its more readable and there are no enemies before Minos
	match CombatVariables.next_level:
		"Limbust":
			CombatVariables.Choose_enemy("limbust_enemy")
		"Gleed":
			CombatVariables.Choose_enemy("gleed_enemy")
		"Wreresy":
			CombatVariables.Choose_enemy("wreresy_enemy")
		"Vraud":
			CombatVariables.Choose_enemy("vraud_enemy")
		"Treachery":
			CombatVariables.Choose_enemy("treachery_enemy")

