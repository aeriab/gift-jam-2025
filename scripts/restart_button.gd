extends Button

@onready var player = $"../Player"
@onready var grey_grid = $"../GreyGrid"


func _on_pressed():
	grey_grid.restart()
	player.restart()
