extends Node2D

const MUSHROOM : PackedScene = preload("res://scenes/mushroom/mushroom.tscn")


func add_mushroom(row: int, col: int) -> bool:
	assert(row >= 0 and row < Global.ROWS)
	assert(col >= 0 and col < Global.COLS)
	var target_position = Vector2(col * 16 + 8, row * 16 + Global.ROW_OFFSET + 8)
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = target_position
	parameters.collision_mask = 0b00000000_00000000_00000000_00000100
	var result = get_world_2d().direct_space_state.intersect_point(parameters)
	if (len(result) > 0):
		return false

	var newMushroom = MUSHROOM.instantiate()
	newMushroom.set_position(target_position)
	add_child(newMushroom)
	return true


func generate_mushrooms(num_mushrooms: int):
	var generated = 0
	while (generated < num_mushrooms):
		var i = randi() % (Global.ROWS - 1)
		var j = randi() % Global.COLS
		var success = add_mushroom(i, j)
		if (success):
			generated += 1


func spawn_centipede():
	print_debug('centipede')


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var num_mushrooms = randi() % 16 + 35
	print_debug('Generating ', num_mushrooms, ' mushrooms...')
	generate_mushrooms(num_mushrooms)
	spawn_centipede()
	print_debug('done')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
