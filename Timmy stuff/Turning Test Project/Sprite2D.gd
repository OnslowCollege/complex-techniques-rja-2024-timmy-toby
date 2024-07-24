extends Sprite2D

# Class properties
var speed = 400
var angular_speed = PI

# Initialization function
func _init():
	print("Hell world")

# Func that runs frame-by-frame, updates rotation and position based off of speed and angular speed variables
func _process(delta):
	#rotation += angular_speed * delta
	# Replacing to account for user input with:
	var direction = 0
	if Input.is_action_pressed("ui_left"):
	## Multiplies rotation equation by -1, turning player left
		direction = -1
	if Input.is_action_pressed("ui_right"):
	# Multiplies rotation equation by 1, turning player right.
		direction = 1
	
	rotation += angular_speed * direction * delta
	
	#var velocity = Vector2.UP.rotated(rotation) * speed
	# Replacing to account for user input with:
	var velocity = Vector2.ZERO # Vector2 is just the literal vector for 2d movement
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.UP.rotated(rotation) * speed * -1
	
	position += velocity * delta


func _on_button_pressed():
	set_process(not is_processing())
