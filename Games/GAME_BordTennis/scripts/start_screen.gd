extends Control

@onready var press_start_label = $PressStart
@onready var high_score_label = $HighScore
#@onready var demo_timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.frame = 0
	_frame_timer = 0.0
	high_score_label.text = str("High Score: ", SaveLoad.highest_record)
	#demo_timer.start(6.0)
	MusicManager.music_player.play()
	print(Engine.time_scale)
	

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/arcade.tscn")
		MusicManager.music_player.stop()
	if Input.is_action_just_pressed("Jump"):
		print("nononononojumpmpmp")
		MusicManager.music_player.stop()
		#demo_timer.stop()
		#BordTennisGlobal.demo_mode = false
		get_tree().change_scene_to_file("res://Games/GAME_BordTennis/scenes/bord_tennis.tscn")
	var frames = $AnimatedSprite2D.sprite_frames
	var anim = $AnimatedSprite2D.animation  # or hardcode the anim name
	for i in frames.get_frame_count(anim):
		var duration = frames.get_frame_duration(anim, i)
		print("Frame %d duration: %s" % [i, duration])
	
	#if event.is_pressed() and not event.is_echo():
		#demo_timer.stop()
		#BordTennisGlobal.demo_mode = false
		#get_tree().change_scene_to_file("res://scenes/GAME_BordTennis/bord_tennis.tscn")
		
		
#func _on_timer_timeout():
	#BordTennisGlobal.demo_mode = true
	#get_tree().change_scene_to_file("res://scenes/GAME_BordTennis/bord_tennis.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	#blink_timer += delta
	#if blink_timer >= 0.6:
		#press_start_label.visible = !press_start_label.visible
		#blink_timer = 0.0
		
var _frame_timer = 0.0

func _process(delta: float) -> void:
	var frames = $AnimatedSprite2D.sprite_frames
	var anim = $AnimatedSprite2D.animation
	var fps = frames.get_animation_speed(anim)
	var current_frame = $AnimatedSprite2D.frame
	
	var frame_duration = frames.get_frame_duration(anim, current_frame)
	var time_per_frame = (1.0 / fps) * frame_duration
	
	_frame_timer += delta
	if _frame_timer >= time_per_frame:
		_frame_timer -= time_per_frame
		var frame_count = frames.get_frame_count(anim)
		$AnimatedSprite2D.frame = (current_frame + 1) % frame_count
