extends Node

signal score_changed(score)
var score : int = 0:
	set(new_score):
		assert(score >= 0 and score <= 99999999)
		score = new_score
		emit_signal('score_changed', score)

#func update_score(score: int):
	#score_changed.emit(score)
