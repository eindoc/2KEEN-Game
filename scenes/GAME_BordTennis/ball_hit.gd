extends AudioStreamPlayer2D

var min_pitch = 0.5
var max_pitch = 4.0

func _ready():
	pass

func play_range():
	randomize()
	pitch_scale = randf_range(0.5, 8.0)
	play()
