extends CharacterBody2D

const ACCELERATION = 150.0
const SPEED = 450.0
var old_x_pos: int = 0
var showing_placeholder : bool = false

const BulletScene : PackedScene = preload("res://scenes/bullet/bullet.tscn")
@onready var placeholder_bullet: Sprite2D = $PlaceholderBullet
@onready var animation_player: AnimationPlayer = $AnimationPlayer


#NOTE: debug
func _ready():
	position.y = (Global.ROWS) * 16 + 8
	position.x = (Global.COLS / 2) * 16

	#max_slides = 0
	#Engine.set_time_scale(0.5)


func _process(_delta):
	if not get_parent().has_node("Bullet"):
		if (!placeholder_bullet.visible):
			animation_player.play('show_bullet')
		if Input.is_action_pressed("shoot"):
			animation_player.play('hide_bullet')
			shoot()


func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	var x_direction = Input.get_axis("move_left", "move_right")
	if x_direction:
		if (x_direction > 0 and velocity.x < 0 or x_direction < 0 and velocity.x > 0):
			velocity.x = 0
		velocity.x += x_direction * ACCELERATION
	else:
		velocity.x = 0 #move_toward(velocity.x, 0, SPEED)
	
	var y_direction = Input.get_axis("move_up", "move_down")
	if y_direction:
		if (y_direction > 0 and velocity.y < 0 or y_direction < 0 and velocity.y > 0):
			velocity.y = 0
		velocity.y += y_direction * ACCELERATION
	else:
		velocity.y = 0 #move_toward(velocity.y, 0, SPEED)
	
	velocity = velocity.limit_length(SPEED)
	
	old_x_pos = int(position.x)
	
	move_and_slide()
	
	position.x = floor(position.x + 0.5)
	if (position.x as int % 16 == 0):
		if (old_x_pos < position.x):
			position.x += 1
		else:
			position.x -= 1
	position.y = floor(position.y + 0.5)
	
	if (get_parent().has_node('Bullet')):
		var bullet = get_parent().get_node('Bullet') as Bullet
		if (bullet.position.y >= position.y - 24):
			bullet.global_transform.origin.x = position.x


func shoot():
	var bullet = BulletScene.instantiate()
	bullet.position = self.position
	get_parent().add_child(bullet)
