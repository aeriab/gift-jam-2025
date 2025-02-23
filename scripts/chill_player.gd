extends Node2D

var desired_pos = Vector2(-337.5,-337.5)

const FOLLOW_SPEED = 8.0

var normed_pos = Vector2(1,1)
@onready var grey_grid = $"../GreyGrid"

func restart():
	desired_pos = Vector2(-337.5,-337.5)
	normed_pos = Vector2(1,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	new_norm_pos()

#grey_grid.move_player(normed_pos.y,normed_pos.x,Vector2(0,-1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_down") && grey_grid.move_player(normed_pos.x,normed_pos.y,Vector2(0,-1)):
		Globals.player_moved = "down"
		desired_pos.y += 225
		moving_actions()
	if Input.is_action_just_pressed("ui_up") && grey_grid.move_player(normed_pos.x,normed_pos.y,Vector2(0,1)):
		Globals.player_moved = "up"
		desired_pos.y -= 225
		moving_actions()
	if Input.is_action_just_pressed("ui_left") && grey_grid.move_player(normed_pos.x,normed_pos.y,Vector2(-1,0)):
		Globals.player_moved = "left"
		desired_pos.x -= 225
		moving_actions()
	if Input.is_action_just_pressed("ui_right") && grey_grid.move_player(normed_pos.x,normed_pos.y,Vector2(1,0)):
		Globals.player_moved = "right"
		desired_pos.x += 225
		moving_actions()
	
	position = position.lerp(desired_pos, delta * FOLLOW_SPEED)
	
	Globals.player_pos = desired_pos

func moving_actions():
	Globals.move_cycle += 1
	new_norm_pos()


func new_norm_pos():
	#Globals.matrix[normed_pos.y][normed_pos.x] = 0
	normed_pos.x = (desired_pos.x / 225.0) + 2.5
	normed_pos.y = (desired_pos.y / 225.0) + 2.5
	#Globals.matrix[normed_pos.y][normed_pos.x] = -1
