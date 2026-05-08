
extends Node

@export var sound: AudioStream
@export var voice_count: int = 8
@export var pitch_spread: float = 0.15  # how much pitch can vary per voice

var players: Array[AudioStreamPlayer] = []


func _ready() -> void:
	for i in voice_count:
		var player := AudioStreamPlayer.new()
		player.stream = sound
		player.pitch_scale = 1.0 + randf_range(-pitch_spread, pitch_spread)
		player.volume_db = randf_range(-3.0, 0.0)  # slight volume variation too
		add_child(player)
		players.append(player)


func play_crowd() -> void:
	for player in players:
		# stagger start times slightly so they don't all fire on the same frame
		var delay := randf_range(0.0, 0.08)
		get_tree().create_timer(delay).timeout.connect(player.play)


func stop_crowd() -> void:
	for player in players:
		player.stop()
