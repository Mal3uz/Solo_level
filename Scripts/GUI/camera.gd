extends Camera2D

@export var player: CharacterBody2D
@export var tilemap: TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var map_rect = tilemap.get_used_rect()
	var title_size = tilemap.cell_quadrant_size
	var world_size = map_rect.size * title_size
	limit_right = world_size.x
	limit_bottom = world_size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = player.position
