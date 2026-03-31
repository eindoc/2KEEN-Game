extends Node

var basketcase: AudioStreamPlayer
var musicProgress: float = 0.0
var current_stream: AudioStream


func _ready() -> void:
	print("MusicManager ready (script-only autoload)")
	# Create the AudioStreamPlayer once
	basketcase = AudioStreamPlayer.new()
	basketcase.name = "basketcase"
	add_child(basketcase)
	

	# Set a default music stream here
	# (replace the path with your actual music file)
	basketcase.stream = preload("res://sound/basketcasebgmusic.wav")
	current_stream = basketcase.stream

	# Optional: make sure it plays automatically on startup

func play_music(stream: AudioStream = null) -> void:
	if stream:
		current_stream = stream
		basketcase.stream = stream
		

	# Don’t restart if already playing
	if not basketcase.playing:
		basketcase.play(musicProgress)
		print("Playing from:", musicProgress)

func save_music_progress() -> void:
	if basketcase and basketcase.playing:
		musicProgress = basketcase.get_playback_position()
		print("Saved progress:", musicProgress)
