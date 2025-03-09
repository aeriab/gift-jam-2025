extends Node2D

func _on_button_pressed():
	if !Globals.has_started_before:
		Globals.isInGame = true
		Globals.has_started_before = true
		get_tree().change_scene_to_file("res://scenes/chill_game.tscn")
	else:
		Globals.isInGame = true
		get_tree().change_scene_to_packed(Globals.get_game_scene())
