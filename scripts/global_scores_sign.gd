extends Label

@onready var BordTennisScore = $/root/Hud/HighScore



func _ready():
	BordTennisScore.text = "Score: " + str(GlobalScores.score)

func _process(delta: float) -> void:
	print(BordTennisScore)
