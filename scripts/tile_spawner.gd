extends Sprite2D

var tile_array = []
@onready var score = $"../Score"

var tile_1 = preload("res://scenes/tile_1.tscn")
@onready var audio_stream_player = $"../combineSound/AudioStreamPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_tile()
	Globals.move_cycle = 1

func find_zero_positions(matrix: Array) -> Array[Vector2]:
	var zero_positions: Array[Vector2] = []
	if matrix.is_empty():
		return zero_positions
	for y in range(matrix.size() - 2):
		var row = matrix[y + 1]
		if row is Array: # Check if the row is actually an array
			for x in range(row.size() - 2):
				if row[x + 1] == 0:
					zero_positions.append(Vector2(x+1, y+1))
	
	return zero_positions

func get_random_vector2(vector2_array: Array[Vector2]) -> Vector2:
	if vector2_array.is_empty():
		return Vector2(0, 0)  # Return a default Vector2 if the array is empty.
	var random_index = randi() % vector2_array.size()
	return vector2_array[random_index]

func restart():
	for child in get_children():
		remove_child(child)
		child.queue_free()
	Globals.matrix=[[0,0,0,0,0,0],[0,-1,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
	Globals.player_pos=Vector2(-337.5,-337.5)
	Globals.player_moved="down"
	Globals.move_cycle = 8

@onready var dead_popup = $"../deadPopup"

func generate_tile():
	var rand_open_tile = get_random_vector2(find_zero_positions(Globals.matrix))
	if rand_open_tile == Vector2(0,0):
		get_tree().paused = true
		dead_popup.visible = true
		print("GAME OVER")
	else:
		spawn_tile(randi_range(1,2), rand_open_tile)

func spawn_tile(size, pos):
	var tile = tile_1.instantiate()
	tile.size = size
	tile.x = pos.x - 1
	tile.y = pos.y - 1
	add_child(tile)
	Globals.matrix[pos.y][pos.x] = size
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.move_cycle >= 8:
		Globals.move_cycle = 0
		generate_tile()
		##print(" ")
		##print(" ")
		##print(" ")
		##print(" ")
		##print(" ")
		print(" ")
		print(Globals.matrix[0])
		print(Globals.matrix[1])
		print(Globals.matrix[2])
		print(Globals.matrix[3])
		print(Globals.matrix[4])
		print(Globals.matrix[5])
		print(" ")

func play_sound(size):
	audio_stream_player.pitch_scale = 5.0 / float(size - 1.0)
	audio_stream_player.play()

func push_boxes(box_row, box_col, direction):
	var delta_row = direction.x
	var delta_col = direction.y
	var next_row = box_row + delta_row
	var next_col = box_col - delta_col
	
	if !(1 <= next_row and next_row < len(Globals.matrix) - 1 and 1 <= next_col and next_col < len(Globals.matrix[0]) - 1):
		return false
	if Globals.matrix[next_col][next_row] >= 1:
		if !push_boxes(next_row, next_col, direction):
			if Globals.matrix[next_col][next_row] == Globals.matrix[box_col][box_row]:
				Globals.increase_points(pow(2,Globals.matrix[next_col][next_row] + 1))
				score.text = "Score: " + str(Globals.points)
				play_sound(Globals.matrix[next_col][next_row] + 1)
				Globals.tell_box_to_move(box_row,box_col,direction)
				Globals.tell_box_to_upgrade(next_row,next_col)
				Globals.matrix[next_col][next_row] = Globals.matrix[next_col][next_row] + 1
				return true
			else:
				return false
	
	Globals.matrix[next_col][next_row] = Globals.matrix[box_col][box_row]
	Globals.matrix[box_col][box_row] = 0
	
	Globals.tell_box_to_move(box_row,box_col,direction)
	#print("telling x:" + str(box_row) + " y:" + str(box_col) + " to move: " + str(direction))
	
	return true

func move_player(player_row, player_col, direction):
	var delta_row = direction.x
	var delta_col = direction.y
	var next_row = player_row + delta_row
	var next_col = player_col - delta_col
	
	if !(0 <= next_row and next_row < len(Globals.matrix) and 0 <= next_col and next_col < len(Globals.matrix[0])):
		return false
	
	if Globals.matrix[next_col][next_row] >= 1:
		if push_boxes(next_row, next_col, direction):
			Globals.matrix[player_col][player_row] = 0
			Globals.matrix[next_col][next_row] = -1
			return true
		else:
			return false
	
	Globals.matrix[player_col][player_row] = 0
	Globals.matrix[next_col][next_row] = -1
	return true
