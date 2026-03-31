extends Node2D

@onready var ball = preload("res://scenes/GAME_BordTennis/ball.gd")
@onready var brickObject = preload("res://scenes/GAME_BordTennis/bricks.tscn")

var columns = 10
var rows = 1
var margin = 100

func _ready() -> void:
	setupLevel()
	
	
func setupLevel():
	for r in rows:
		for c in columns:
			var randomNumber = randi_range(0, 2)
			if randomNumber > 0:
				var newBrick = brickObject.instantiate()
				add_child(newBrick)
				newBrick.position = Vector2(margin + (98 * c), margin + (168 * r))
	
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/arcade.tscn")
		
func _on_brick_timer_timeout() -> void:
	setupLevel()
