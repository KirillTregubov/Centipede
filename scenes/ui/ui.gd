extends Control

const LifeTexture = preload("res://assets/art/bugblaster.png") 
@onready var LifeContainer : HBoxContainer = $HBoxContainer/LifeContainer
@onready var ScoreNode : Label = $HBoxContainer/ScoreContainer/Score
@onready var HighScoreNode : Label = $MarginContainer2/HighScore

#TODO: move to settings
var STARTING_LIVES = 2

const MAX_LIVES = 6
var num_lives = 0

func add_life():
	if (num_lives >= MAX_LIVES): return
	var texture = TextureRect.new()
	texture.texture = LifeTexture
	LifeContainer.add_child(texture)


func update_score(score: int):
	assert(score >= 0 and score <= 99999999)
	var newScore = str(score)
	ScoreNode.text = '0' + newScore if score < 10 else newScore


func update_high_score(score: int):
	assert(score >= 0 and score <= 99999999)
	var newScore = str(score)
	HighScoreNode.text = '0' + newScore if score < 10 else newScore


# Called when the node enters the scene tree for the first time.
func _ready():
	for n in STARTING_LIVES:
		add_life()
	update_score(0)
	update_high_score(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
