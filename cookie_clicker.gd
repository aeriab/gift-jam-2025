extends Node2D

@export var button : Button

var xMax = 356
var yMax = 99
 
var xMin = -576
var yMin = -328

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Globals.increase_points(1)
	var tween = get_tree().create_tween().set_parallel()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	
	var xPos = randf_range(xMin, xMax)
	var yPos = randf_range(yMin, yMax)
	var scale = randf_range(0.01,0.05)
	
	tween.tween_property(
	button,
	'position',
	Vector2(xPos, yPos),
	0.5
	)
	
	tween.tween_property(
	button,
	'scale',
	Vector2(scale, scale),
	0.5
	)
	pass # Replace with function body.
