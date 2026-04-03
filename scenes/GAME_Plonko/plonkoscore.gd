extends Node


var score: int = 0:
	set(value):
		score = value
		score_changed.emit(score)

signal score_changed(new_score)
