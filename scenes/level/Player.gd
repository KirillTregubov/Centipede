extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 0

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var x_direction = Input.get_axis("move_left", "move_right")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = 0 #move_toward(velocity.x, 0, SPEED)
	
	var y_direction = Input.get_axis("move_up", "move_down")
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = 0 #move_toward(velocity.y, 0, SPEED)

	move_and_slide()
