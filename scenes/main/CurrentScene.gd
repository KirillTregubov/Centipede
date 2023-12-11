extends Node2D

var game_started : bool = false
signal start_game()

@onready var TransitionPlayer := $"../Transition/TransitionPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	#self.visible = false
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !game_started && Input.is_action_pressed("start"):
		game_started = true
		print_debug('start pressed')
		emit_signal("start_game")


func _on_start_game():
	print_debug('start game')
	TransitionPlayer.play("fade_to_black")
	# TODO: animate out
	#get_tree().change_scene_to_file("res://scenes/level/level.tscn")
