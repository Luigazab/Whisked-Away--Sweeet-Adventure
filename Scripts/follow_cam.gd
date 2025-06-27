extends Camera2D

@onready var tilemap := get_node("../ground")
func _ready():
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.tile_set.tile_size
	var world_size = map_rect.size * tile_size
	limit_left = 0
	limit_top = 0
	limit_right = world_size.x
	limit_bottom = world_size.y
