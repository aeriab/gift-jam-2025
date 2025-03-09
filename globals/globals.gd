extends Node

signal points_changed
@export var points: int = 0

func increase_points(amt):
	points += amt
	points_changed.emit()

var matrix=[[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
var player_pos=Vector2(-337.5,-337.5)
var player_moved="down"

var move_cycle: int = 6

signal my_global_signal(x,y,dir)
signal upgrade_global_signal(x,y)

var x_of_interest: int
var y_of_interest: int
var direction_of_interest: Vector2

var tilesBroughtBack: bool = false
var isInGame: bool = false
var has_started_before: bool = false
var _game_scene: PackedScene = PackedScene.new()

func set_game_scene(scene: Node):
	return _game_scene.pack(scene)

func get_game_scene() -> PackedScene:
	return _game_scene

func tell_box_to_move(box_row,box_col,direction):
	emit_signal("my_global_signal", box_row,box_col,direction)
	x_of_interest = box_row
	y_of_interest = box_col
	direction_of_interest = direction

func tell_box_to_upgrade(box_row,box_col):
	emit_signal("upgrade_global_signal", box_row,box_col)
