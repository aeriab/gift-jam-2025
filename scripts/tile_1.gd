extends Sprite2D

var size: int
var x: int
var y: int
const _1_ANGEL_TILE = preload("res://assets/emoji_tiles/1_angel_tile.png")
const _2_TOXIC_TILE = preload("res://assets/emoji_tiles/2_toxic_tile.png")
const FOLLOW_SPEED = 8.0

var normed_pos: Vector2 = Vector2(0,0)

var desired_pos

func _ready():
	if size == 1:
		texture = _1_ANGEL_TILE
	elif size == 2:
		texture = _2_TOXIC_TILE
	
	position.x = (x - 1.5) * 225
	position.y = (y - 1.5) * 225
	
	desired_pos = position
	new_norm_pos()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Globals.player_pos.x <= desired_pos.x + 20 and Globals.player_pos.x >= desired_pos.x - 20) and (Globals.player_pos.y <= desired_pos.y + 20 and Globals.player_pos.y >= desired_pos.y - 20):
		if Globals.player_moved == "up":
			if desired_pos.y > -300:
				desired_pos.y -= 225
				new_norm_pos()
		if Globals.player_moved == "down":
			if desired_pos.y < 300:
				desired_pos.y += 225
				new_norm_pos()
		if Globals.player_moved == "left":
			if desired_pos.x > -300:
				desired_pos.x -= 225
				new_norm_pos()
		if Globals.player_moved == "right":
			if desired_pos.x < 300:
				desired_pos.x += 225
				new_norm_pos()
	
	
	
	position = position.lerp(desired_pos, delta * FOLLOW_SPEED)

func new_norm_pos():
	Globals.matrix[normed_pos.y][normed_pos.x] = 0
	normed_pos.x = (desired_pos.x / 225.0) + 1.5
	normed_pos.y = (desired_pos.y / 225.0) + 1.5
	Globals.matrix[normed_pos.y][normed_pos.x] = -1
