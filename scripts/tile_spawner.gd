extends Sprite2D

var tile_array = []

var tile_1 = preload("res://scenes/tile_scenes/tile_1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in range(10):
		var random_x_start = randi_range(0,3)
		var random_y_start = randi_range(0,3)
		for y in range(6):
			Globals.matrix.append([])
			Globals.matrix[y]=[]
			for x in range(6):
				Globals.matrix[y].append([])
				if y == random_y_start and x == random_x_start:
					var tile_birth_size: int = randi_range(1,2)
					spawn_tile(tile_birth_size,x,y)
					print("birth: " + str(tile_birth_size) + " x: " + str(x) + " y: " + str(y))
				else:
					Globals.matrix[y][x]=0
	
	print(Globals.matrix)

func spawn_tile(size, x, y):
	var tile = tile_1.instantiate()
	tile.size = size
	tile.x = x
	tile.y = y
	add_child(tile)
	Globals.matrix[y][x] = size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
