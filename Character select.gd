extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Character_container/Acolyte/Acolyte_label.hide()
	$Character_container/Mage/Mage_label.hide()
	$Character_container/Paladin/Paladin_label.hide()
	$Character_container/Performer/Performer_label.hide()
	$Character_container/Warrior/Warrior_label.hide()



func _on_acolyte_pressed():
	PlayerVariables.Assign_class(PlayerVariables.acolyte_stats)
	start_game()


func _on_mage_pressed():
	PlayerVariables.Assign_class(PlayerVariables.mage_stats)
	start_game()


func _on_paladin_pressed():
	PlayerVariables.Assign_class(PlayerVariables.paladin_stats)
	start_game()


func _on_performer_pressed():
	PlayerVariables.Assign_class(PlayerVariables.performer_stats)
	start_game()


func _on_warrior_pressed():
	PlayerVariables.Assign_class(PlayerVariables.warrior_stats)
	start_game()


func _on_mage_mouse_entered():
	$Character_container/Mage/Mage_label.show()


func _on_mage_mouse_exited():
	$Character_container/Mage/Mage_label.hide()


func _on_performer_mouse_entered():
	$Character_container/Performer/Performer_label.show()


func _on_performer_mouse_exited():
	$Character_container/Performer/Performer_label.hide()


func _on_warrior_mouse_entered():
	$Character_container/Warrior/Warrior_label.show()


func _on_warrior_mouse_exited():
	$Character_container/Warrior/Warrior_label.hide()


func _on_acolyte_mouse_entered():
	$Character_container/Acolyte/Acolyte_label.show()


func _on_acolyte_mouse_exited():
	$Character_container/Acolyte/Acolyte_label.hide()


func _on_paladin_mouse_entered():
	$Character_container/Paladin/Paladin_label.show()


func _on_paladin_mouse_exited():
	$Character_container/Paladin/Paladin_label.hide()

func start_game():
	get_tree().change_scene_to_file("res://tilemaps/floor_1/Limbust.tscn")
