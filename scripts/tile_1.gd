extends Sprite2D

var size: int
var x: int
var y: int
const _1_ANGEL_TILE = preload("res://assets/emoji_tiles/1_angel_tile.png")
const _2_TOXIC_TILE = preload("res://assets/emoji_tiles/2_toxic_tile.png")
const FOLLOW_SPEED = 8.0

var normed_pos: Vector2 = Vector2(0,0)

var desired_pos

var move_is_going: bool = false

var my_mover_index: int

func _ready():
	if size == 1:
		texture = _1_ANGEL_TILE
	elif size == 2:
		texture = _2_TOXIC_TILE
	
	position.x = (x - 1.5) * 225
	position.y = (y - 1.5) * 225
	
	desired_pos = position
	new_norm_pos()

func near_player_pos():
	return ((Globals.player_pos.x <= desired_pos.x + 20 and Globals.player_pos.x >= desired_pos.x - 20) and (Globals.player_pos.y <= desired_pos.y + 20 and Globals.player_pos.y >= desired_pos.y - 20))

func _process(delta):
	if (normed_pos.x == Globals.x_of_interest and normed_pos.y == Globals.y_of_interest):
		desired_pos.y -= 225 * Globals.direction_of_interest.y
		desired_pos.x += 225 * Globals.direction_of_interest.x
		Globals.x_of_interest = -69420
		Globals.y_of_interest = -69420
		new_norm_pos()
	
	if (normed_pos.x == Globals.x_of_interest2 and normed_pos.y == Globals.y_of_interest2):
		desired_pos.y -= 225 * Globals.direction_of_interest2.y
		desired_pos.x += 225 * Globals.direction_of_interest2.x
		Globals.x_of_interest2 = -69420
		Globals.y_of_interest2 = -69420
		new_norm_pos()
	
	#if near_player_pos():
		#if Globals.player_moved == "up":
			##print(get_parent().push_boxes(normed_pos.y, normed_pos.x, Vector2(0,1)))
			#if desired_pos.y > -300:
				#desired_pos.y -= 225
				#new_norm_pos()
		#if Globals.player_moved == "down":
			#if desired_pos.y < 300:
				#desired_pos.y += 225
				#new_norm_pos()
		#if Globals.player_moved == "left":
			#if desired_pos.x > -300:
				#desired_pos.x -= 225
				#new_norm_pos()
		#if Globals.player_moved == "right":
			#if desired_pos.x < 300:
				#desired_pos.x += 225
				#new_norm_pos()
	
	position = position.lerp(desired_pos, delta * FOLLOW_SPEED)

func new_norm_pos():
	#Globals.matrix[normed_pos.y][normed_pos.x] = 0
	normed_pos.x = (desired_pos.x / 225.0) + 2.5
	normed_pos.y = (desired_pos.y / 225.0) + 2.5
	#Globals.matrix[normed_pos.y][normed_pos.x] = size
