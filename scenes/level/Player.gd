extends CharacterBody2D

const ACCELERATION = 400.0
const SPEED = 400.0

var BulletScene : PackedScene = preload("res://scenes/bullet/bullet.tscn")

func _process(delta):
	if not get_parent().has_node("Bullet") and Input.is_action_pressed("shoot"):
		shoot()

func _physics_process(_delta):
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

func shoot():
	# Create a new instance of the bullet scene
	var bullet = BulletScene.instantiate()

	# Set the bullet's position to the player's position
	bullet.position = self.position
	#bullet.position.x -= 16

	# Add the bullet to the scene tree
	get_parent().add_child(bullet)
