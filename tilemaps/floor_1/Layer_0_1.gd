extends TileMap

## Set tilemap coordinates for starting positon
@export var starting_coords_tilemap = Vector2i(6, 1)

## Process tilemap coordinates into local, then global pixel coordinates
@export var starting_coords_local: Vector2 = map_to_local(starting_coords_tilemap)
var starting_coords_global: Vector2 = to_global(starting_coords_local) 
## I don't need to convert to global since tilemap pos is already at 0,0. Keeping this here just in case.

signal give_start_coords(starting_coords_global: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready():
	print(starting_coords_local)
	print(starting_coords_global)
	give_start_coords.emit(starting_coords_global)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
