extends Control
const FAMILY_GUY = preload("res://assets/family_guy_clips/family_guy.ogv")

@onready var video_stream_player: VideoStreamPlayer = $RigidBody2D/VideoStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	video_stream_player.stream = FAMILY_GUY
	video_stream_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_rigid_body_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print(event)
	if event is InputEventMouse:
		print("asdf")




func _on_video_stream_player_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == 1:
			print("asdf")
			print()
			video_stream_player.stop()
			video_stream_player.stream_position = 1000*randf()
			video_stream_player.play()
