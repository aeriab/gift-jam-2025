extends Sprite2D

var size: int
var x: int
var y: int
const _1_ANGEL_TILE = preload("res://assets/emoji_tiles/1_angel_tile.png")
const _2_TOXIC_TILE = preload("res://assets/emoji_tiles/2_toxic_tile.png")
const _3_COWBOY_TILE = preload("res://assets/emoji_tiles/3_cowboy_tile.png")
const _4_CHILLY_TILE = preload("res://assets/emoji_tiles/4_chilly_tile.png")
const _5_DEMON_TILE = preload("res://assets/emoji_tiles/5_demon_tile.png")
const _6_BLUE_SKULL_TILE = preload("res://assets/emoji_tiles/6_blue_skull_tile.png")
const _7_BARF_TILE = preload("res://assets/emoji_tiles/7_barf_tile.png")
const _8_MONEY_TILE = preload("res://assets/emoji_tiles/8_money_tile.png")

const FOLLOW_SPEED = 8.0

var normed_pos: Vector2 = Vector2(0,0)

var desired_pos

var move_is_going: bool = false

var my_mover_index: int

func on_upgrade_signal_received(x,y):
	if normed_pos.x == x and normed_pos.y == y:
		size += 1

func on_global_signal_received(x,y,dir):
	if normed_pos.x == x and normed_pos.y == y:
		desired_pos.y -= 225 * dir.y
		desired_pos.x += 225 * dir.x
		new_norm_pos()
		#print("MOVING " + str(x) + ", " + str(y) + "    in dir: " + str(dir))
		

func _ready():
	Globals.my_global_signal.connect(on_global_signal_received)
	Globals.upgrade_global_signal.connect(on_upgrade_signal_received)
	
	if size == 1:
		texture = _1_ANGEL_TILE
	elif size == 2:
		texture = _2_TOXIC_TILE
	
	position.x = (x - 1.5) * 225
	position.y = (y - 1.5) * 225
	
	desired_pos = position
	new_norm_pos()

#func near_player_pos():
	#return ((Globals.player_pos.x <= desired_pos.x + 20 and Globals.player_pos.x >= desired_pos.x - 20) and (Globals.player_pos.y <= desired_pos.y + 20 and Globals.player_pos.y >= desired_pos.y - 20))

func _process(delta):
	
	if size == 1:
		texture = _1_ANGEL_TILE
	elif size == 2:
		texture = _2_TOXIC_TILE
	elif size == 3:
		texture = _3_COWBOY_TILE
	elif size == 4:
		texture = _4_CHILLY_TILE
	elif size == 5:
		texture = _5_DEMON_TILE
	elif size == 6:
		texture = _6_BLUE_SKULL_TILE
	elif size == 7:
		texture = _7_BARF_TILE
	elif size == 8:
		texture = _8_MONEY_TILE
	
	position = position.lerp(desired_pos, delta * FOLLOW_SPEED)

func new_norm_pos():
	#Globals.matrix[normed_pos.y][normed_pos.x] = 0
	normed_pos.x = (desired_pos.x / 225.0) + 2.5
	normed_pos.y = (desired_pos.y / 225.0) + 2.5
	#Globals.matrix[normed_pos.y][normed_pos.x] = size
