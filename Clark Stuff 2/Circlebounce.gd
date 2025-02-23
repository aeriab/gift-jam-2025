extends Node2D

@export var square_scene: PackedScene  # Scene for the square
@export var num_sides: int = 6  # Number of sides (default hexagon)
@export var radius: float = 100.0  # Distance from center to square centers
@export var angular_speed: float = 2.0  # Rotation speed in radians per second
@export var collision_layer: int = 1  # Layer for the squares
@export var collision_mask: int = 2  # Mask for detecting collisions

func _ready():
	generate_ngon()
	
func _process(delta):
	pass
func generate_ngon():
	#print("GENERATING")
	if num_sides < 3:
		push_error("Number of sides must be 3 or more!")
		return

	var angle_step = TAU / num_sides  # Full circle divided into steps
	var side_length = 2 * radius * sin(angle_step / 2)  # Side length for regular n-gon

	for i in range(num_sides+1):
		var angle = i * angle_step
		var square = square_scene.instantiate() as RigidBody2D
		
		if square:
			var x_pos = cos(angle) * radius
			var y_pos = sin(angle) * radius

			square.position = Vector2(x_pos, y_pos)
			square.rotation = angle  # Align with n-gon edge
			square.scale = Vector2(0.1, side_length / square.get_child(0).get_texture().get_size().x)  # Adjust scale

			# Disable gravity so squares don't fall
			square.gravity_scale = 0  # 🚀 FIX GRAVITY
			
			# Prevent the squares from moving freely
			square.freeze = true  # 🚀 LOCK POSITION
			
			square.set_collision_layer(collision_layer)
			square.set_collision_mask(collision_mask)  # Only collides with the circle
			
			add_child(square)
