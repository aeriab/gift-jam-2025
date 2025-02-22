extends Node2D

var desired_pos = Vector2(-337.5,-337.5)

const FOLLOW_SPEED = 8.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		desired_pos.y += 225
	if Input.is_action_just_pressed("ui_up"):
		desired_pos.y -= 225
	if Input.is_action_just_pressed("ui_left"):
		desired_pos.x -= 225
	if Input.is_action_just_pressed("ui_right"):
		desired_pos.x += 225
	
	position = position.lerp(desired_pos, delta * FOLLOW_SPEED)
