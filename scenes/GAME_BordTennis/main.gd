extends Node2D

@onready var score_label = $Hud/Score
@onready var highest_label = $Hud/HighScore
@onready var lives_label = $Hud/Lives
#@onready var brickObjects = $Bricks
#@onready var extraball = $BallsXtra

@onready var game_over_panel = get_parent().get_node("GameOverPanel")
@onready var final_score_label = get_parent().get_node("GameOverPanel/VBoxContainer/FinalScore")
@onready var game_over_high_score_label = get_parent().get_node("GameOverPanel/VBoxContainer/HighScore")

var current_score = 0
var lives = 3

signal score_changed(score)

func _ready():
	#print(get_parent().get_node_or_null("GameOverPanel"))
	#print(get_node_or_null("../GameOverPanel"))
	#print(get_node_or_null("../GameOverPanel/VBoxContainer/FinalScore"))
	#print(get_node_or_null("../GameOverPanel/VBoxContainer/FinalScore"))
	GlobalScores.update_high_score(SaveLoad.highest_record)
	highest_label.text = str("High Score: ", SaveLoad.highest_record)
	update_lives_display()
	
	
func add_point():
	print("point")
	current_score += 1
	score_label.text = str(current_score)
	emit_signal("score_changed")
	
	#$Ball.increase_speed_by(50)
	#if current_score % 8 == 0:
		#$BallsXtra.new_ball()
	
	if current_score > SaveLoad.highest_record:
		SaveLoad.highest_record = current_score
		highest_label.text = str("High Score: ", current_score)
		GlobalScores.BordTennisHighScore = current_score
	SaveLoad.save_score()
	
func lose_life():
	if BordTennisGlobal.demo_mode:
		get_tree().change_scene_to_file("res://scenes/GAME_BordTennis/control.tscn")
		return
	lives -=1
	update_lives_display()
	if lives <= 0:
		game_over()
	else:
		$Ball.reset()
	
func update_lives_display():
	lives_label.text = str("Lives: ", lives)
	
func game_over():
	print(final_score_label)
	print(game_over_high_score_label)
	print(game_over_panel)
	$Ball.is_active = false
	final_score_label.text = str("Score: ", current_score)
	game_over_high_score_label.text = str("High Score: ", SaveLoad.highest_record)
	GlobalScores.update_high_score(current_score)
	game_over_panel.visible = true
	
func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GAME_BordTennis/bord_tennis.tscn")

func _on_return_to_arcade_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/arcade.tscn")
	
func _input(event):
	if BordTennisGlobal.demo_mode:
		if event.is_pressed() and not event.is_echo():
			BordTennisGlobal.demo_mode = false
			get_tree().change_scene_to_file("res://scenes/GAME_BordTennis/control.tscn")
