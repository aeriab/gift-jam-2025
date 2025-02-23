extends Node2D

@export var point_counter : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.points_changed.connect(_on_points_changed)
	pass # Replace with function body.

func _on_points_changed():
	point_counter.text = "Points: " + str(Globals.points)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
