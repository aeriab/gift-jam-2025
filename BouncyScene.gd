extends Node2D

@export var physics_material: PhysicsMaterial  # Assign the material in Inspector
@export var n_gon_gen: Node2D  # Assign the parent rotating n-gon

@export var force_magnitude: float = 200.0  # How strong the random push is

var touch

func _ready():
	touch=true
	#randomize_physics()
	#randomize_n_gon_parameters()
	apply_random_force()
	
func _process(diff):
	var ball = find_child("Ball")
	if Input.is_action_just_pressed("mouse_click"):
		#print("FORCE")
		if touch:
			print("FORCE")
			apply_random_force()
	if ball!=null:
		#print("RERUN")
		if n_gon_gen.num_loops==0:# or ball.position.y>1500:
			reset()
func reset():
	var ball = find_child("Ball")
	ball.reset()
	randomize_physics()
	randomize_n_gon_parameters()
	apply_random_force()
	n_gon_gen.generate_loops()
			
func apply_random_force():
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))  # Any random direction
	#var velocity_boost = random_direction * force_magnitude
	var ball = find_child("Ball")
	if ball:
		ball.linear_velocity += ball.linear_velocity.normalized()*force_magnitude  # Apply the force to the ball

func randomize_physics():
	if physics_material:
		physics_material.friction = randf_range(0.0, 1.0)  # Random friction
		physics_material.bounce = randf_range(5, 10000)  # Random bounce
		physics_material.rough =0# = randi() % 2 == 0  # Random roughness on/off
		physics_material.absorbent = 0# = randi() % 2 == 0  # Random absorption on/off

func randomize_n_gon_parameters():
	if n_gon_gen:
		n_gon_gen.num_loops = randi_range(5, 20)  # Random sides (triangle to dodecagon)
		n_gon_gen.initial_radius = 100#randf_range(50.0, 200.0)  # Random polygon size
		n_gon_gen.num_sides=100
		n_gon_gen.radius_increment = randf_range(5,20)  # Random polygon size
		n_gon_gen.angular_speed = randf_range(0.1, 5)  # Random rotation speed
		n_gon_gen.max_angular_offset = randi_range(0, TAU/12)
		n_gon_gen.sector_size = randf_range(0.15, 0.5)
		print(n_gon_gen.sector_size)


func _on_control_mouse_entered() -> void:
	print('enter')
	touch=true
	pass # Replace with function body.


func _on_control_mouse_exited() -> void:
	#print(touch)
	touch=false
	pass # Replace with function body.
