extends RigidBody2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	position=Vector2(0,0)
	linear_velocity=Vector2(0,0)
	
func reset():
	move_and_collide(Vector2.ZERO - position)
	linear_velocity=Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	for node in get_colliding_bodies():
		audio_stream_player_2d.play()
		
