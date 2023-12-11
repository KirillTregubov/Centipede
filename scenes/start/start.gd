extends Control

@export var transition_duration = 1.00
@export var transition_type = 1 # TRANS_SINE

# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug('aaaa')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
	#pass


func _on_start_game():
	print_debug('start screen signal')
	var tween = get_tree().create_tween()
	tween.tween_property($MainMenuMusic,  "volume_db", -80, transition_duration).set_ease(Tween.EASE_IN).set_trans(transition_type)
	tween.play()
	pass # Replace with function body.
