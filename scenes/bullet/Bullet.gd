extends RigidBody2D
class_name Bullet

const SPEED = 850.0
var collided = false
@onready var player : CharacterBody2D = get_parent().get_node("Player")


func _ready():
	assert(player)
	self.get_parent().move_child(self, 0)
	self.position.y -= 6
	self.position.x = player.position.x
	apply_impulse(Vector2(0, -SPEED))


func _physics_process(_delta):
	# Remove bullet after reaching top
	if position.y < 16:
		queue_free()


func _on_body_entered(body: Node) -> void:
	# TODO: is it still needed?
	if (collided):
		return
	if (body.is_in_group('Mushroom')):
		collided = true
		queue_free()
		(body.get_parent() as Mushroom).take_damage()
