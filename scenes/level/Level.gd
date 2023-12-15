extends Node2D

const Mushroom : PackedScene = preload("res://scenes/mushroom/mushroom.tscn")

func add_mushroom(col: int, row: int):
	assert(col >= 0 and col < Global.COLS)
	assert(row >= 0 and row < Global.ROWS)
	var newMushroom = Mushroom.instantiate()
	newMushroom.set_position(Vector2(col * 16 + 8, row * 16 + Global.ROW_OFFSET + 8))
	add_child(newMushroom)

func generate_mushrooms(num_mushrooms: int):
	var generated = 0
	
	for i in range(Global.ROWS):
		for j in range(Global.COLS):
			add_mushroom(i, j)
	
	#while (generated < num_mushrooms):
	print_debug('generated')


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var num_mushrooms = randi() % 51 + 30
	print_debug(num_mushrooms)
	generate_mushrooms(num_mushrooms)
	
	print_debug('done')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
