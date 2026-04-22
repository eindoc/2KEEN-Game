extends Node2D

@onready var score_label = $Hud/Score
@onready var highest_label = $Hud/HighScore
@onready var lives_label = $Hud/Lives
@onready var brickObjects = $Bricks
@onready var extraball = $BallsXtra

var current_score = 0
var lives = 3

signal score_changed(score)

func _ready():
	GlobalScores.update_high_score(SaveLoad.highest_record)
	highest_label.text = str("High Score: ", SaveLoad.highest_record)
	update_lives_display()
	
	
func add_point():
	print("point")
	current_score += 1
	score_label.text = str(current_score)
	emit_signal("score_changed")
	
	$Ball.increase_speed_by(50)
	#if current_score % 8 == 0:
		#$BallsXtra.new_ball()
	
	if current_score > SaveLoad.highest_record:
		SaveLoad.highest_record = current_score
		highest_label.text = str("High Score: ", current_score)
		GlobalScores.BordTennisHighScore = current_score
	SaveLoad.save_score()
	
func lose_life():
	lives -=1
	update_lives_display()
	if lives <= 0:
		game_over()
	else:
		$Ball.reset()
	
func update_lives_display():
	lives_label.text = str("Lives: ", lives)
func game_over():
	GlobalScores.update_high_score(current_score)
	get_tree().change_scene_to_file("res://scenes/arcade.tscn")
	
