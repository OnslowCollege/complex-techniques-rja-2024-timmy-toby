extends Control

##
## CODED BY TOBY
##

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Health potion/Health text".hide()
	$"Health potion/Health cost".hide()
	$"Stamina potion/Stamina text".hide()
	$"Stamina potion/Stamina cost".hide()
	$"Blessing level/Blessing text".hide()
	$"Blessing level/Blessing cost".hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"Karma level".region_rect.position.y == 182:
		$"Blessing level".disabled = true
		$"Blessing level/Blessing text".text = "Max blessing level achieved"
		$"Blessing level/Blessing text".position.x = -36
		$"Blessing level/Blessing cost".hide()


func _on_health_potion_mouse_entered():
	$"Health potion/Health text".show()
	$"Health potion/Health cost".show()


func _on_health_potion_mouse_exited():
	$"Health potion/Health text".hide()
	$"Health potion/Health cost".hide()


func _on_stamina_potion_mouse_entered():
	$"Stamina potion/Stamina text".show()
	$"Stamina potion/Stamina cost".show()


func _on_stamina_potion_mouse_exited():
	$"Stamina potion/Stamina text".hide()
	$"Stamina potion/Stamina cost".hide()


func _on_blessing_level_mouse_entered():
	$"Blessing level/Blessing text".show()
	$"Blessing level/Blessing cost".show()


func _on_blessing_level_mouse_exited():
	$"Blessing level/Blessing text".hide()
	$"Blessing level/Blessing cost".hide()


func _on_health_potion_pressed():
	# Health + 50, blessing points - 5
	pass


func _on_stamina_potion_pressed():
	# Stamina + 50, blessing points - 5
	pass


func _on_blessing_level_pressed():
	# Blessing level + 1, max health + 10, max stamina + 10,
	# blessing points - 5
	$"Karma level".region_rect.position.y += 26


func _on_exit_button_pressed():
	pass
