extends Control

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
