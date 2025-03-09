extends Button

@onready var player = $"../Player"
@onready var grey_grid = $"../GreyGrid"
@onready var dead_popup = $"../deadPopup"

func _on_pressed():
	Globals.tilesBroughtBack = false
	Globals.isInGame = false
	Globals.set_game_scene(get_tree().current_scene)
	get_tree().change_scene_to_file("res://scenes/click_to_start_scene.tscn")
