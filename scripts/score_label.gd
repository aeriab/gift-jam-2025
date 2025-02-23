extends Label


func _process(delta):
	text = "Score: " + str(Globals.points)
