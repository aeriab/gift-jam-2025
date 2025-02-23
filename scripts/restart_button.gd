extends Button

@onready var player = $"../Player"
@onready var grey_grid = $"../GreyGrid"
@onready var color_rect = $"../ColorRect"
@onready var game_over_label = $"../GameOverLabel"



func _on_pressed():
	color_rect.visible = false
	game_over_label.visible = false
	get_tree().paused = false
	player.restart()
	grey_grid.restart()
	print("made here")
