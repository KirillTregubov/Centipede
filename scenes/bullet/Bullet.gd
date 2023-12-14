extends RigidBody2D
class_name Bullet

const SPEED = 850.0

@onready var player : CharacterBody2D = get_parent().get_node("Player")

var offset = 0
var final_position_x = 0


func _ready():
	assert(player)
	self.get_parent().move_child(self, 0)
	self.position.y -= 6
	self.position.x = player.position.x
	#offset = self.position.y - 16
	
	apply_impulse(Vector2(0, -SPEED))


func _physics_process(delta):
	# Check if the bullet's position is outside of the viewport
	if position.y < 16: #  position.y < offset - 100 or 
		queue_free()


#func _on_body_entered(body: Node) -> void:
	#print_debug(body)
	#if (body is CollisionObject2D):
		#print_debug(body.collision_layer)
	##if (body.get_collision_layer()):
		##print_debug('is shroom')
