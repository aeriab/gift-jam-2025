extends Button

@onready var player = $"../Player"
@onready var grey_grid = $"../GreyGrid"
@onready var color_rect = $"../ColorRect"



func _on_pressed():
	color_rect.visible = false
	get_tree().paused = false
	player.restart()
	grey_grid.restart()
