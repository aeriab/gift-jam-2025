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
	Globals.points += 1
	
	var xPos = randf_range(xMin, xMax)
	var yPos = randf_range(yMin, yMax)
	var scale = randf_range(0.01,0.1)
	
	button.position = Vector2(xPos, yPos)
	button.scale = Vector2(scale, scale)
	pass # Replace with function body.
