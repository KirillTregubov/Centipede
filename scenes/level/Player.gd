extends CharacterBody2D

const ACCELERATION = 400.0
const SPEED = 400.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	var x_direction = Input.get_axis("move_left", "move_right")
	if x_direction:
		velocity.x += x_direction * ACCELERATION
	else:
		velocity.x = 0 #move_toward(velocity.x, 0, SPEED)
	
	var y_direction = Input.get_axis("move_up", "move_down")
	if y_direction:
		velocity.y = y_direction * ACCELERATION
	else:
		velocity.y = 0 #move_toward(velocity.y, 0, SPEED)
	
	velocity = velocity.limit_length(SPEED)

	move_and_slide()
