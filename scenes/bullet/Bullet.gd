extends RigidBody2D

const SPEED = 850.0

func _ready():
	self.get_parent().move_child(self, 0)
	self.position.y -= 6
	apply_impulse(Vector2(0, -SPEED))

func _physics_process(delta):
	# Get the size of the viewport
	var viewport_rect = get_viewport_rect().size

	# Check if the bullet's position is outside of the viewport
	if position.y < 16:
		# Despawn the bullet
		queue_free()
