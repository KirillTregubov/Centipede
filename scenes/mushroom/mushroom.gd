extends Node2D
class_name Mushroom

const MAX_HEALTH = 4
var health: int = MAX_HEALTH

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func take_damage():
	health -= 1
	if (health == 0):
		Global.score += 1
		queue_free()
	sprite.frame += 1


func _ready() -> void:
	sprite.frame = 0


#func _process(delta: float) -> void:
	#pass


#func _on_body_entered(body: Node2D) -> void:
	#print_debug(Time.get_ticks_msec())
	#if (body.is_in_group('Bullet')):
		#body.queue_free()
		#take_damage()
