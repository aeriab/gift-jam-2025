extends Node

@export var points: int = 0

var matrix=[]
var player_pos=Vector2(-337.5,-337.5)
var player_moved="down"


func change_matrix_val(x,y,val):
	Globals.matrix[y][x] = -1
