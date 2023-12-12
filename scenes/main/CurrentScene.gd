extends Node2D

var game_started : bool = false
signal start_game()

@onready var TransitionPlayer := $"../Transition/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !game_started && Input.is_action_pressed("start"):
		game_started = true
		emit_signal("start_game")


func _on_start_game():
	TransitionPlayer.play("fade_to_black")


func _on_start_screen_game_loaded():
	self.visible = true
	TransitionPlayer.play("fade_to_normal")
