extends RigidBody2D

const SPEED = 850.0

@onready var player : CharacterBody2D = get_parent().get_node("Player")

var offset = 0
var final_position_x = 0


func _ready():
	assert(player)
	self.get_parent().move_child(self, 0)
	self.position.y -= 6
	offset = self.position.y - 16

	apply_impulse(Vector2(0, -SPEED))


func _physics_process(_delta):
	# Check if the bullet's position is outside of the viewport
	if position.y < offset - 50 or position.y < 16:
		queue_free()


func _integrate_forces(state: PhysicsDirectBodyState2D):
	var position = state.transform.origin
	if (position.y >= offset):
		final_position_x = player.position.x + (player.velocity.x * state.step)

	state.transform.origin.x = final_position_x
