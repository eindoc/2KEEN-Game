extends Node

var music_player: AudioStreamPlayer

func _ready():
	music_player = AudioStreamPlayer.new()
	music_player.stream = preload("res://sound/Return Of The Living Dead Theme.mp3")
	#music_player.volume_db = 0.0
	add_child(music_player)
	#music_player.play()





#extends Node
#
#var zombiesong: AudioStreamPlayer
#var musicProgress: float = 0.0
#var current_stream: AudioStream
#
#
#func _ready() -> void:
	#print("MusicManager ready (script-only autoload)")
	## Create the AudioStreamPlayer once
	#zombiesong = AudioStreamPlayer.new()
	#zombiesong.name = "zombiesong"
	#add_child(zombiesong)
	## Set a default music stream here
	## (replace the path with your actual music file)
	#zombiesong.stream = preload("res://sound/Return Of The Living Dead Theme.mp3")
	#current_stream = zombiesong.stream
#
	## Optional: make sure it plays automatically on startup
#
#func play_music(stream: AudioStream = null) -> void:
	#if stream:
		#current_stream = stream
		#zombiesong.stream = stream
		#
#
	## Don’t restart if already playing
	#if not zombiesong.playing:
		#zombiesong.play(musicProgress)
		#print("Playing from:", musicProgress)
#
#func save_music_progress() -> void:
	#if zombiesong and zombiesong.playing:
		#musicProgress = zombiesong.get_playback_position()
		#print("Saved progress:", musicProgress)
