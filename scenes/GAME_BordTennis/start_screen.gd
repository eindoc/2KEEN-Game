extends Control

@onready var press_start_label = $VBoxContainer/PressStart
var blink_timer = 0.0
@onready var high_score_label = $"VBoxContainer/HighScore"
@onready var demo_timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	high_score_label.text = str("High Score: ", SaveLoad.highest_record)
	
	demo_timer.start(2.0)
	

func _input(event):
	if event.is_pressed() and not event.is_echo():
		demo_timer.stop()
		BordTennisGlobal.demo_mode = false
		get_tree().change_scene_to_file("res://scenes/GAME_BordTennis/bord_tennis.tscn")
		
		
func _on_timer_timeout():
	BordTennisGlobal.demo_mode = true
	get_tree().change_scene_to_file("res://scenes/GAME_BordTennis/bord_tennis.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#blink_timer += delta
	#if blink_timer >= 0.6:
		#press_start_label.visible = !press_start_label.visible
		#blink_timer = 0.0
