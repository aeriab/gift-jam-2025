extends Node2D

@export var polygon_scene: PackedScene  # Assign your existing n-gon scene here
@export var ball_scene: PackedScene  # Assign your existing n-gon scene here
@export var initial_radius: float = 100.0  # Starting size of the first loop
@export var max_radius: float = 250.0  # Starting size of the first loop
#@export var angular_speed: float = 2.0  # Rotation speed of each polygon
#@export var sector_size: float = 0.1  # how much to offset 0-1
@export var num_sides: float = 100  # how much to offset 0-1
@export var rad_speed = 40
@export var ball_prob = 0.1
@export var random_force = 300
@export var scale_init = 1

var polygon
var ball

var touch

func _ready():
	touch = false
	generate_loops()
	
func randomize():
	rad_speed = randf_range(10,100)
	ball_prob = randf_range(0.01,0.3)
	random_force = randf_range(100,1000)
	scale_init = randf_range(0.1,1)
func _process(delta):
	
	if Input.is_action_just_pressed("mouse_click"):
		if touch:
			print("INST")
			var temp = ball_scene.instantiate() as Node2D
			#temp.scale = temp.scale* scale_init
			temp.ball_prob = ball_prob
			temp.random_force = random_force
			temp.start_rad = initial_radius
			temp.max_rad = max_radius
			add_child(temp)
	if ball==null:
		#print("INST")
		randomize()
		ball = ball_scene.instantiate() as Node2D
		#ball.scale = ball.scale* scale_init
		ball.ball_prob = ball_prob
		ball.random_force = random_force
		ball.start_rad = initial_radius
		ball.max_rad = max_radius
		add_child(ball)
		#print(ball.position)
		#ball.position = Vector2(0,0)
	initial_radius-=delta*rad_speed
	if polygon:
		remove_child(polygon)
		polygon.queue_free()
	generate_loops()

func generate_loops():
	if find_child("Sector")!=null:
		return
	if not polygon_scene:
		push_error("polygon_scene is not assigned! Assign the n-gon scene.")
		return

	polygon = polygon_scene.instantiate() as Node2D
	
	if polygon:
		# Increase size for each loop
		var loop_radius = initial_radius
		polygon.radius = loop_radius  # Assuming `radius` exists in the n-gon script
		#polygon.sector_size = initial_radius*TAU*sector_size
		polygon.num_sides=num_sides
		# Apply an angular offset to each loop
		#polygon.rotation = (max_angular_offset*TAU / num_loops) * i
		
		add_child(polygon)
		
		
func _on_control_mouse_entered() -> void:
	print('enter')
	touch=true
	pass # Replace with function body.

func _on_control_mouse_exited() -> void:
	#print(touch)
	touch=false
	pass # Replace with function body.
