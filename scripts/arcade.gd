extends Node2D


func _ready():
	print("Main menu _ready() called")
	print("GlobalScores value: ", GlobalScores.BordTennisHighScore)
	
	var score_label = $GlobalScores
	if score_label:
		score_label.text = "high score: " + str(GlobalScores.BordTennisHighScore)
	
	if score_label:
		print("Setting label text...")
		score_label.text = "High Score: " + str(GlobalScores.BordTennisHighScore)
		print("Label text set to: ", score_label.text)
	else:
		print("ERROR: GlobalScores label not found in scene!")
		print("Available children: ", get_children())
