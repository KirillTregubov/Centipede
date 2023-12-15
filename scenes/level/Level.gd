extends Node2D

const Mushroom : PackedScene = preload("res://scenes/mushroom/mushroom.tscn")


func add_mushroom(row: int, col: int):
	assert(row >= 0 and row < Global.ROWS)
	assert(col >= 0 and col < Global.COLS)
	var newMushroom = Mushroom.instantiate()
	newMushroom.set_position(Vector2(col * 16 + 8, row * 16 + Global.ROW_OFFSET + 8))
	add_child(newMushroom)


func generate_mushrooms(num_mushrooms: int):
	var generated = 0
	while (generated < num_mushrooms):
		var i = randi() % (Global.ROWS - 1)
		var j = randi() % Global.COLS
		add_mushroom(i, j)
		generated += 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var num_mushrooms = randi() % 16 + 35
	print_debug('Generated ', num_mushrooms, ' mushrooms')
	generate_mushrooms(num_mushrooms)
	print_debug('done')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
