extends Node

@export var points: int = 0

var matrix=[[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
var player_pos=Vector2(-337.5,-337.5)
var player_moved="down"

var move_cycle: int = 0

signal my_global_signal(x,y,dir)
signal upgrade_global_signal(x,y)


var x_of_interest: int
var y_of_interest: int
var direction_of_interest: Vector2

var x_of_interest2: int
var y_of_interest2: int
var direction_of_interest2: Vector2

func tell_box_to_move(box_row,box_col,direction):
	emit_signal("my_global_signal", box_row,box_col,direction)
	x_of_interest = box_row
	y_of_interest = box_col
	direction_of_interest = direction

func tell_box_to_upgrade(box_row,box_col):
	emit_signal("upgrade_global_signal", box_row,box_col)


#func tell_box_to_move2(box_row,box_col,direction):
	#x_of_interest = box_row
	#y_of_interest = box_col
	#direction_of_interest = direction
	#x_of_interest2 = box_row + direction.x
	#y_of_interest2 = box_col - direction.y
	#direction_of_interest2 = direction
	#print("x1: " + str(x_of_interest))
	#print("x2: " + str(x_of_interest2))
