extends Sprite2D

var tile_array = []

var tile_1 = preload("res://scenes/tile_scenes/tile_1.tscn")

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


func generate_tile():
	var rand_open_tile = get_random_vector2(find_zero_positions(Globals.matrix))
	if rand_open_tile == Vector2(0,0):
		print("GAME OVER")
	spawn_tile(randi_range(1,2), rand_open_tile)
	#print(rand_open_tile)
	#for i in range(1):
		#var random_x_start = randi_range(0,3)
		#var random_y_start = randi_range(0,3)
		#for y in range(6):
			#for x in range(6):
				#if y == random_y_start and x == random_x_start:
					#var tile_birth_size: int = randi_range(1,2)
					#spawn_tile(tile_birth_size,x,y)
					#print("birth: " + str(tile_birth_size) + " x: " + str(x) + " y: " + str(y))

func spawn_tile(size, pos):
	var tile = tile_1.instantiate()
	tile.size = size
	tile.x = pos.x - 1
	tile.y = pos.y - 1
	add_child(tile)
	Globals.matrix[pos.y][pos.x] = size
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.move_cycle >= 6:
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
