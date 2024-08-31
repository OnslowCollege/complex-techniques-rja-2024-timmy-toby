extends TileMap

signal floor_information
signal position_information(moveOptions, currentTileType)
signal give_start_coords(starting_coords_global: Vector2)

## Related to floor actions on startup
## Set starting coords for this tilemap here
@export var starting_coords_tilemap = Vector2i(6, 1)
## Related to converting tilemap coordinates to world/pixel coordinates
@export var starting_coords_local: Vector2 = map_to_local(starting_coords_tilemap)
var starting_coords_global: Vector2 = to_global(starting_coords_local) 
## I don't need to convert to global since tilemap pos is already at 0,0. Keeping this here just in case.


## Related to getting the movement options for the player.
var newPosition_local
var newPosition_map
var moveOptions = [
	[0, 0],
	[0, 0],
	[0, 0],
	[0, 0],
] ## 2d array, options are ordered right, down, left, up
## Related to getting the current tile the player is on
var currentTileID
var currentTileType
const tileTypeKey = { # Likely will have to be tweaked per level
	0 : "Start",
	1 : "Lore",
	2 : "Enemy",
	3 : "Bonfire",
	4 : "Boss",
}


# Called when the node enters the scene tree for the first time.
func _ready():
	give_start_coords.emit(starting_coords_global)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_new_position(current_position):
	## Getting surrounding cells for future functionality
	newPosition_local = to_local(current_position)
	newPosition_map = local_to_map(newPosition_local)
	print(newPosition_map)
	moveOptions = get_surrounding_cells(newPosition_map)
	
	for i in range(len(moveOptions)):
		print(moveOptions[i][0], ",", moveOptions[i][1])
	
	## Identifying the cell currently occupied
	## Processed here so player code is consistent
	currentTileID = get_cell_source_id(0, newPosition_map)
	print("Atlas Coords ", currentTileID)
	
	if currentTileID in tileTypeKey.keys():
		currentTileType = tileTypeKey[currentTileID]
		print(currentTileType)
	else:
		currentTileType = "Floor"
		print("Floor")
	
	position_information.emit(moveOptions, currentTileType)
