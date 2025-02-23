extends Node2D

@export var polygon_scene: PackedScene  # Assign your existing n-gon scene here
@export var num_loops: int = 5  # Number of polygon layers
@export var initial_radius: float = 50.0  # Starting size of the first loop
@export var radius_increment: float = 30.0  # How much larger each loop gets
@export var angular_speed: float = 2.0  # Rotation speed of each polygon
@export var max_angular_offset: float = 0.1  # how much to offset 0-1
@export var sector_size: float = 0.1  # how much to offset 0-1
@export var num_sides: float = 100  # how much to offset 0-1


@export var radius=initial_radius
func _ready():
	generate_loops()

func generate_loops():
	if find_child("Sector")!=null:
		return
	if not polygon_scene:
		push_error("polygon_scene is not assigned! Assign the n-gon scene.")
		return

	print(num_loops)
	for i in range(num_loops):
		var polygon = polygon_scene.instantiate() as Node2D
		
		if polygon:
			# Increase size for each loop
			var loop_radius = initial_radius + (i * radius_increment)
			polygon.radius = loop_radius  # Assuming `radius` exists in the n-gon script
			polygon.angular_speed = angular_speed  # Ensure all loops rotate at same speed
			polygon.sector_size = initial_radius*TAU*sector_size
			polygon.num_sides=num_sides
			# Apply an angular offset to each loop
			polygon.rotation = (max_angular_offset*TAU / num_loops) * i
			
			add_child(polygon)
