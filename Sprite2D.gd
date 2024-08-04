extends Sprite2D


var screensize
var stepsize = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size
	$Node2D.position = Vector2(1, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
