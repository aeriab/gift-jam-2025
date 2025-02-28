extends Node2D

@onready var color_rect = $ColorRect
@onready var gift_jam_player_5 = $"Gift-jam-player5"
@onready var click_to_play = $ClickToPlay


# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = false
	gift_jam_player_5.visible = false
	click_to_play.visible = false
