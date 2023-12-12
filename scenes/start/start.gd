extends Control

signal game_loaded()

@export var transition_duration = 1.00
@export var transition_ease = Tween.EASE_IN
@export var transition_type = 1 # TRANS_SINE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
	#pass


func _on_start_game():
	var tween = get_tree().create_tween()
	tween.tween_property($MainMenuMusic,  "volume_db", -80, transition_duration).set_ease(transition_ease).set_trans(transition_type)
	tween.tween_callback(_on_fade_out)
	tween.play()


func _on_fade_out():
	self.visible = false
	emit_signal('game_loaded')
	# TODO: figure out how this works
	queue_free()
