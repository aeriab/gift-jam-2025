extends Node2D

@onready var family_guy: VideoStreamPlayer = $RigidBody2D/FamilyGuy
@onready var subway_surfers: VideoStreamPlayer = $RigidBody2D/SubwaySurfers
@onready var minecraft_parkour: VideoStreamPlayer = $RigidBody2D/MinecraftParkour

@onready var clips = [family_guy, subway_surfers, minecraft_parkour]

var clip_idx = 0


@onready var rigid_body = $RigidBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Ensure randomness by seeding (only needed once in _ready or earlier)
	randomize()

	clip_idx = randi() % clips.size()
	# Pick a random element
	var clip = clips[clip_idx]
	clip.show()
	clip.paused = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if rigid_body.get_contact_count() > 0:
		rigid_body.angular_velocity += randf()
		
		var r = randf()

		if r < 0.5:
			clips[clip_idx].hide()
			clips[clip_idx].paused = true

			clip_idx = randi() % clips.size()

			var clip = clips[clip_idx]
			clip.show()
			clip.paused = false
