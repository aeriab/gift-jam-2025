extends Sprite2D

var size: int
var x: int
var y: int
const _1_ANGEL_TILE = preload("res://assets/emoji_tiles/1_angel_tile.png")
const _2_TOXIC_TILE = preload("res://assets/emoji_tiles/2_toxic_tile.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if size == 1:
		texture = _1_ANGEL_TILE
	elif size == 2:
		texture = _2_TOXIC_TILE
	
	position.x = (x - 1.5) * 225
	position.y = (y - 1.5) * 225
