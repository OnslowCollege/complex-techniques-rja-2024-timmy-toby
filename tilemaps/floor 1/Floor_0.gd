extends TileMap

## Set starting coords for this tilemap here
@export var starting_coords_tilemap = Vector2i(6, 1)
## Related to converting tilemap coordinates to world/pixel coordinates
@export var starting_coords_local: Vector2 = map_to_local(starting_coords_tilemap)
var starting_coords_global: Vector2 = to_global(starting_coords_local) 
## I don't need to convert to global since tilemap pos is already at 0,0. Keeping this here just in case.

## Related to getting the movement options for the player.
var convertPosition_toLocal
var moveOptionsBase
var moveOptions = [
	[0, 0],
	[0, 0],
	[0, 0],
	[0, 0],
] ## 2d array, options are ordered up, down, left, right

signal give_start_coords(starting_coords_global: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready():
	give_start_coords.emit(starting_coords_global)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_new_position(current_position):
	convertPosition_toLocal = to_local(current_position)
	moveOptionsBase = local_to_map(convertPosition_toLocal)
	print(moveOptionsBase)
	moveOptions = get_surrounding_cells(moveOptionsBase)
	
	## Direction relevant modifications
	## moveOptions[0][1] = moveOptionsBase[1] - 1
	## moveOptions[1][1] = moveOptionsBase[1] + 1
	## moveOptions[2][0] = moveOptionsBase[0] + 1
	## moveOptions[3][0] = moveOptionsBase[0] - 1
	## 
	## ## Consistency related modifications
	## moveOptions[0][0] = moveOptionsBase[0]
	## moveOptions[1][0] = moveOptionsBase[0]
	## moveOptions[2][1] = moveOptionsBase[1]
	## moveOptions[3][1] = moveOptionsBase[1]
	
	
	for i in range(len(moveOptions)):
		print(moveOptions[i][0], ",", moveOptions[i][1])
