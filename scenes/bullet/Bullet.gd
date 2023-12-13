extends RigidBody2D

const SPEED = 850.0

var offset = 0
var final_position_x = 0

#var tracking = true
#var previous_velocity = 0

@onready var player : CharacterBody2D = get_parent().get_node("Player")

func _ready():
	assert(player)
	self.get_parent().move_child(self, 0)
	self.position.y -= 6
	offset = self.position.y - 16
	#self.position.x = player.position.x
	#tracking = true
	#previous_velocity = player.velocity.x
	apply_impulse(Vector2(0, -SPEED))
	#self.position.x = player.position.x


func _physics_process(_delta):
	#if (position.y >= LIMIT):
		#if (tracking):
			#print_debug('update')
			#apply_force(Vector2(player.velocity.x, 0))
	#else:
		#tracking = false
	
	# Check if the bullet's position is outside of the viewport
	if position.y < offset - 50 or position.y < 16:
		queue_free()

func _integrate_forces(state: PhysicsDirectBodyState2D):
	var position = state.transform.origin
	if (position.y >= offset):
		# Move with the player in the x direction
		#print_debug('update')
		final_position_x = player.position.x + (player.velocity.x * state.step)
		#state.transform.origin.x = player.position.x # + (player.velocity.x * state.step)
		#position.x = + (player.velocity.x * state.step)

	state.transform.origin.x = final_position_x
	### Move up until reaching the target y position
	###if position.y > LIMIT:
		###position.y -= SPEED * state.step
##
	##state.transform.origin = position
	##print_debug(state.transform.origin, state.transform.origin.x)
	##state.set_position

#func _integrate_forces(state: PhysicsDirectBodyState2D):
	## check if the current Y position is less than the target_y
	#if state.get_transform().origin.y < LIMIT:
		## Calculate the difference in the X positions
		#var x_difference : float = player.global_position.x - state.get_transform().origin.x
		#
		## Update the X position of the RigidBody2D
		#print_debug('update x')
		#state.apply_force(Vector2(x_difference, 0))
		## You can also set the Y position directly if needed
		##state.set_transform(Transform2D(Vector2(state.get_transform().origin.x, LIMIT), state.get_transform().basis))
