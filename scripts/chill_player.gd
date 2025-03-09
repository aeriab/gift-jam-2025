extends Node2D

@export var desired_pos = Vector2(-562.5,-562.5)

const FOLLOW_SPEED = 8.0

@export var normed_pos = Vector2(0,0)
@onready var grey_grid = $"../GreyGrid"
@onready var audio_stream_player = $AudioStreamPlayer
@onready var audio_stream_player_2 = $AudioStreamPlayer2
@onready var audio_stream_player_3 = $AudioStreamPlayer3
@onready var audio_stream_player_4 = $AudioStreamPlayer4
@onready var audio_stream_player_5 = $AudioStreamPlayer5
@onready var audio_stream_player_6 = $AudioStreamPlayer6

func restart():
	desired_pos = Vector2(-562.5,-562.5)
	normed_pos = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	new_norm_pos()

@onready var char_one_block = $"../CharOneBlock"
@onready var char_one_block_2 = $"../CharOneBlock2"
@onready var char_one_block_3 = $"../CharOneBlock3"
@onready var char_one_block_4 = $"../CharOneBlock4"

@export var char_one_free:bool = false
@export var char_two_free:bool = false
@export var char_three_free:bool = false
@export var char_four_free:bool = false


func _process(delta):
	if Globals.isInGame:
		if Globals.points >= 100 and !char_one_free:
			char_one_block.queue_free()
			char_one_free = true
		if Globals.points >= 2500 and !char_two_free:
			char_one_block_2.queue_free()
			char_two_free = true
		if Globals.points >= 10000 and !char_three_free:
			char_one_block_3.queue_free()
			char_three_free = true
		if Globals.points >= 100000 and !char_four_free:
			char_one_block_4.queue_free()
			char_four_free = true
	
	
	
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
const PITCH_MIN = 1.0
const PITCH_MAX = 1.5
func moving_actions():
	if !audio_stream_player.playing:
		audio_stream_player.pitch_scale = randf_range(PITCH_MIN,PITCH_MAX)
		audio_stream_player.play()
	elif !audio_stream_player_2.playing:
		audio_stream_player_2.pitch_scale = randf_range(PITCH_MIN,PITCH_MAX)
		audio_stream_player_2.play()
	elif !audio_stream_player_3.playing:
		audio_stream_player_3.pitch_scale = randf_range(PITCH_MIN,PITCH_MAX)
		audio_stream_player_3.play()
	elif !audio_stream_player_4.playing:
		audio_stream_player_4.pitch_scale = randf_range(PITCH_MIN,PITCH_MAX)
		audio_stream_player_4.play()
	elif !audio_stream_player_5.playing:
		audio_stream_player_5.pitch_scale = randf_range(PITCH_MIN,PITCH_MAX)
		audio_stream_player_5.play()
	elif !audio_stream_player_6.playing:
		audio_stream_player_6.pitch_scale = randf_range(PITCH_MIN,PITCH_MAX)
		audio_stream_player_6.play()
	
	Globals.move_cycle += 1
	new_norm_pos()


func new_norm_pos():
	#Globals.matrix[normed_pos.y][normed_pos.x] = 0
	normed_pos.x = (desired_pos.x / 225.0) + 2.5
	normed_pos.y = (desired_pos.y / 225.0) + 2.5
	#Globals.matrix[normed_pos.y][normed_pos.x] = -1

@onready var gift_jam_player = $"Gift-jam-player"
const GIFT_JAM_PLAYER = preload("res://assets/gift-jam-player.png")
const GIFT_JAM_PLAYER_2 = preload("res://assets/emoji_tiles/gift-jam-player2.png")
const GIFT_JAM_PLAYER_3 = preload("res://assets/emoji_tiles/gift-jam-player3.png")
const GIFT_JAM_PLAYER_4 = preload("res://assets/emoji_tiles/gift-jam-player4.png")
const GIFT_JAM_PLAYER_5 = preload("res://assets/emoji_tiles/gift-jam-player5.png")

func _on_texture_button_pressed():
	gift_jam_player.texture = GIFT_JAM_PLAYER_2
	print("party skin")


func _on_texture_button_2_pressed():
	gift_jam_player.texture = GIFT_JAM_PLAYER_3
	print("dazed skin")


func _on_texture_button_3_pressed():
	gift_jam_player.texture = GIFT_JAM_PLAYER_4
	print("hotdog skin")


func _on_texture_button_4_pressed():
	gift_jam_player.texture = GIFT_JAM_PLAYER_5
	print("skibidi skin")

func _on_texture_button_5_pressed():
	gift_jam_player.texture = GIFT_JAM_PLAYER
	print("basic skin")
