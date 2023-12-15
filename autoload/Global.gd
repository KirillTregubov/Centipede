extends Node

const RESOLUTION = 16
const ROW_OFFSET = 1 * RESOLUTION
const ROWS = 30
const COLS = 30

signal score_changed(score)
var score : int = 0:
	set(new_score):
		assert(score >= 0 and score <= 99999999)
		score = new_score
		emit_signal('score_changed', score)

#func update_score(score: int):
	#score_changed.emit(score)

func _ready():
	randomize()
