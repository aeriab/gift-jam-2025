extends Sprite2D

var tile_array = []

var matrix=[]

var tile_1 = preload("res://scenes/tile_scenes/tile_1.tscn")
var tile_2 = preload("res://scenes/tile_scenes/tile_2.tscn")
var tile_3 = preload("res://scenes/tile_scenes/tile_3.tscn")
var tile_4 = preload("res://scenes/tile_scenes/tile_4.tscn")
var tile_5 = preload("res://scenes/tile_scenes/tile_5.tscn")
var tile_6 = preload("res://scenes/tile_scenes/tile_6.tscn")
var tile_7 = preload("res://scenes/tile_scenes/tile_7.tscn")
var tile_8 = preload("res://scenes/tile_scenes/tile_8.tscn")

var instance1
var instance2
var instance3
var instance4
var instance5
var instance6


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
				#matrix[y][x]=tile_birth_size
				spawn_tile(tile_birth_size,x,y)
				print("birth: " + str(tile_birth_size) + " x: " + str(x) + " y: " + str(y))
			else:
				matrix[y][x]=0
	
	print(matrix)

func spawn_tile(size, x, y):
	var tile = tile_1.instantiate()
	tile.size = size
	tile.x = x
	tile.y = y
	add_child(tile)
	matrix[y][x] = size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
