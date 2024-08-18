extends Control


## Related to players saved stats
var player_class: String
var health: int
var stamina: int
var karma: int
var karma_level: int # to help id the level the player should be returned to.


## Path to relevant save file
const position_save_path = "res://Game/position.save"
const player_save_path = "res://Game/player.save" 
const combat_save_path = "res://Game/combat.save"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control_acolyte/Acolyte_label.hide()
	$Control_Mage/Mage_label.hide()
	$Control_Paladin/Paladin_label.hide()
	$Control_performer/Performer_label.hide()
	$Control_warrior/Warrior_label.hide()



func _on_acolyte_pressed():
	player_class = "Acolyte"
	health = 100
	stamina = 100
	karma = 0
	karma_level = 0
	# Put scene change here Timmy


func _on_mage_pressed():
	player_class = "Mage"
	health = 100
	stamina = 100
	karma = 0
	karma_level = 0
	# Put scene change here Timmy


func _on_paladin_pressed():
	player_class = "Paladin"
	health = 100
	stamina = 100
	karma = 0
	karma_level = 0
	# Put scene change here Timmy


func _on_performer_pressed():
	player_class = "Performer"
	health = 100
	stamina = 100
	karma = 0
	karma_level = 0
	# Put scene change here Timmy


func _on_warrior_pressed():
	player_class = "Warrior"
	health = 100
	stamina = 125
	karma = 0
	karma_level = 0
	# Put scene change here Timmy


func _on_mage_mouse_entered():
	$Control_Mage/Mage_label.show()


func _on_mage_mouse_exited():
	$Control_Mage/Mage_label.hide()


func _on_performer_mouse_entered():
	$Control_performer/Performer_label.show()


func _on_performer_mouse_exited():
	$Control_performer/Performer_label.hide()


func _on_warrior_mouse_entered():
	$Control_warrior/Warrior_label.show()


func _on_warrior_mouse_exited():
	$Control_warrior/Warrior_label.hide()


func _on_acolyte_mouse_entered():
	$Control_acolyte/Acolyte_label.show()


func _on_acolyte_mouse_exited():
	$Control_acolyte/Acolyte_label.hide()


func _on_paladin_mouse_entered():
	$Control_Paladin/Paladin_label.show()


func _on_paladin_mouse_exited():
	$Control_Paladin/Paladin_label.hide()


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
