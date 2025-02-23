extends Node2D

@export var square_scene: PackedScene  # Scene for the square
@export var num_sides: int = 6  # Number of sides (default hexagon)
@export var radius: float = 100.0  # Distance from center to square centers
@export var angular_speed: float = 2.0  # Rotation speed in radians per second
@export var sector_size: float = 10 #sector size in s=pixels
#@export var ball:Node #sector size in s=pixels

func _ready():
	generate_ngon()
	
func _process(delta):
	# Rotate the entire n-gon
	rotation += angular_speed * delta  # Keeps the shape rotating around its center
	var ball = get_parent().get_parent().find_child("Ball")
	if ball:
		if ((ball.position-get_parent().position).length()>radius+10):
			Globals.increase_points(0.25)
			get_parent().num_loops-=1
			queue_free()  # 🚀 Remove this sector when the ball leaves

func generate_ngon():
	#print("GENERATING")
	if num_sides < 3:
		push_error("Number of sides must be 3 or more!")
		return

	var angle_step = TAU / num_sides  # Full circle divided into steps
	var side_length = 2 * radius * sin(angle_step / 2)  # Side length for regular n-gon

	var num_stop = sector_size/side_length
	for i in range(num_sides-num_stop):
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
		
			add_child(square)
