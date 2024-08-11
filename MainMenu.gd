extends Control

const position_save_path = "res://Game/position.save"

var current_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	print("reached")
	current_position = Vector2(1, 1)
	saveposition()
	get_tree().change_scene_to_file("res://tilemaps/floor 1/LimbustFloor.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()

func saveposition(): # Actually moronic solution, position is saved 
	var file = FileAccess.open(position_save_path, FileAccess.WRITE)
	file.store_var(current_position)
