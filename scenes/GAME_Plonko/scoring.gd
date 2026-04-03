extends Label


func _ready() -> void:
	print("plonkoscore node: ", PlonkoScore)
	PlonkoScore.score_changed.connect(_on_score_changed)
	text = "Score: 0"

func _on_score_changed(new_score):
	text = "Score: " + str(new_score)
