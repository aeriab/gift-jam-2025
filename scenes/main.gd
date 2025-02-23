extends Node2D

@export var point_counter : RichTextLabel

@export var rot_buy : Button

@export var rot_array : Array[Node2D] = []

@export var rot_level: int = 0
@export var rot_cost: int = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.points_changed.connect(_on_points_changed)
	pass # Replace with function body.

func _on_points_changed():
	point_counter.text = "Points: " + str(Globals.points)
	pass

func _on_rot_buy_pressed() -> void:
	if(Globals.points < rot_cost):
		return
	
	Globals.increase_points(-rot_cost)
	
	rot_array[rot_level].process_mode = Node.PROCESS_MODE_INHERIT
	rot_array[rot_level].set_visible(true)
	
	rot_level += 1
	
	rot_cost = rot_cost * 10
	
	rot_buy.text = "BUY ROT: " + str(rot_cost) + " points"
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
