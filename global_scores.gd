extends Node

#var BordTennisHighScore = 0
#
#
#
#func update_high_score(new_score):
	#if new_score > BordTennisHighScore:
		#BordTennisHighScore = new_score
		#print("New high score: ", BordTennisHighScore)
	#
#func _ready():
	#pass
	##BordTennisScore.text = "Score: " + str(GlobalScores)

var BordTennisHighScore = 0

func update_high_score(new_score):
	print("update_high_score called with: ", new_score, " type: ", typeof(new_score))
	
	# Convert to int if it's not already a number
	var score_value = 0
	if typeof(new_score) == TYPE_INT or typeof(new_score) == TYPE_FLOAT:
		score_value = int(new_score)
	else:
		print("ERROR: new_score is not a number!")
		return
	
	if score_value > BordTennisHighScore:
		BordTennisHighScore = score_value
		print("New high score: ", BordTennisHighScore)

func reset_high_score():
	BordTennisHighScore = 0
	print("High score reset to 0")
