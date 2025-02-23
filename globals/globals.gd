extends Node

@export var points: int = 0

var matrix=[[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
var player_pos=Vector2(-337.5,-337.5)
var player_moved="down"

var move_cycle: int = 6

signal my_global_signal(x,y,dir)
signal upgrade_global_signal(x,y)

var x_of_interest: int
var y_of_interest: int
var direction_of_interest: Vector2

func tell_box_to_move(box_row,box_col,direction):
	emit_signal("my_global_signal", box_row,box_col,direction)
	x_of_interest = box_row
	y_of_interest = box_col
	direction_of_interest = direction

func tell_box_to_upgrade(box_row,box_col):
	emit_signal("upgrade_global_signal", box_row,box_col)
