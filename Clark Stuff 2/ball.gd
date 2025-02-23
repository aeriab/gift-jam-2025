extends RigidBody2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@export var ball_prob = 0.1
@export var start_rad = 100
@export var max_rad = 500
@export var random_force = 0.1

func apply_random_force():
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))  # Any random direction
	var velocity_boost = random_direction * random_force
	linear_velocity += velocity_boost#force_magnitude  # Apply the force to the ball

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position=Vector2(0,0)
	linear_velocity=Vector2(0,0)
	apply_random_force()
	
func reset():
	move_and_collide(Vector2.ZERO - position)
	linear_velocity=Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (get_parent().initial_radius>max_rad):
		#get_parent().initial_radius = start_rad
		queue_free()

func _physics_process(delta: float) -> void:
	#print(len(get_colliding_bodies()))
	#print(get_parent().initial_radius)
	#if ((position-get_parent().position).length()>get_parent().initial_radius-15):
	if ((position).length()>get_parent().initial_radius-15):
		get_parent().initial_radius+=1
		var dup = self.duplicate()
		var rng = RandomNumberGenerator.new()
		var my_random_number = rng.randf_range(0, 1.0)
		if my_random_number<ball_prob:
			Globals.increase_points(0.5)
			self.get_parent().add_child(dup)
		#initialize()
	#for node in get_colliding_bodies():
		#audio_stream_player_2d.play()
		#get_parent().initial_radius+=5
		#get_parent().initial_radius
