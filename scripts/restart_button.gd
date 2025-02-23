extends Button

@onready var player = $"../Player"
@onready var grey_grid = $"../GreyGrid"
@onready var dead_popup = $"../deadPopup"



func _on_pressed():
	dead_popup.visible = false
	get_tree().paused = false
	player.restart()
	grey_grid.restart()
	print("made here")
