extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control_acolyte/Acolyte_label.hide()
	$Control_Mage/Mage_label.hide()
	$Control_Paladin/Paladin_label.hide()
	$Control_performer/Performer_label.hide()
	$Control_warrior/Warrior_label.hide()



func _on_acolyte_pressed():
	pass # Replace with function body.


func _on_mage_pressed():
	pass # Replace with function body.


func _on_paladin_pressed():
	pass # Replace with function body.


func _on_performer_pressed():
	pass # Replace with function body.


func _on_warrior_pressed():
	pass # Replace with function body.


func _on_control_acolyte_mouse_entered():
	print("emitted")
	$Control_acolyte/Acolyte_label.show()

func _on_control_acolyte_mouse_exited():
	print("emitted")
	$Control_acolyte/Acolyte_label.hide()


func _on_control_mage_mouse_entered():
	print("emitted")
	$Control_Mage/Mage_label.show()


func _on_control_mage_mouse_exited():
	print("emitted")
	$Control_Mage/Mage_label.hide()


func _on_control_paladin_mouse_entered():
	print("emitted")
	$Control_Paladin/Paladin_label.show()


func _on_control_paladin_mouse_exited():
	print("emitted")
	$Control_Paladin/Paladin_label.hide()


func _on_control_performer_mouse_entered():
	print("emitted")
	$Control_performer/Performer_label.show()


func _on_control_performer_mouse_exited():
	print("emitted")
	$Control_performer/Performer_label.hide()


func _on_control_warrior_mouse_entered():
	print("emitted")
	$Control_warrior/Warrior_label.show()


func _on_control_warrior_mouse_exited():
	print("emitted")
	$Control_warrior/Warrior_label.hide()
