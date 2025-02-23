extends Node

@export var points: int = 0

var matrix=[[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
var player_pos=Vector2(-337.5,-337.5)
var player_moved="down"

var move_cycle: int = 0
