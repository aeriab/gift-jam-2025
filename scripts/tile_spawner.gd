extends Sprite2D

var tile_array = []

var matrix=[]


# Called when the node enters the scene tree for the first time.
func _ready():
	var random_x_start = randi_range(0,3)
	var random_y_start = randi_range(0,3)
	for y in range(4):
		matrix.append([])
		matrix[y]=[]
		for x in range(4):
			matrix[y].append([])
			if y == random_y_start and x == random_x_start:
				var tile_birth_size: int = randi_range(1,2)
				matrix[y][x]=tile_birth_size
				#spawn_tile(tile_birth_size,x,y)
				print("birth: " + str(tile_birth_size) + " x: " + str(x) + " y: " + str(y))
			else:
				matrix[y][x]=0
	
	print(matrix)

func spawn_tile(size, x, y):
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
