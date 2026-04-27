extends Node2D

@onready var ball = preload("res://scenes/GAME_BordTennis/ball.gd")
@onready var brickObject = preload("res://scenes/GAME_BordTennis/bricks.tscn")

var columns = 10
var rows = 1
var margin = 25

func _ready() -> void:
	print_tree_pretty()
	setupLevel()
	
	
#func setupLevel():
	#for r in rows:
		#for c in columns:
			#var randomNumber = randi_range(0, 2)
			#if randomNumber > 1:
				#var newBrick = brickObject.instantiate()
				#add_child(newBrick)
				#var stagger = randf_range(-80, 80)
				#newBrick.position = Vector2(margin + (150 * c), -25 + (15 * r) + stagger)
				
func setupLevel():
	var left_barrier = get_node("Main/Borders/Left")
	var right_barrier = get_node("Main/Borders/Right")
	var left_bound = left_barrier.global_position.x + 20   # small padding
	var right_bound = right_barrier.global_position.x - 20
	var spawn_width = right_bound - left_bound
	var column_spacing = spawn_width / columns
	
	for r in rows:
		for c in columns:
			var randomNumber = randi_range(0, 2)
			if randomNumber > 1:
				var newBrick = brickObject.instantiate()
				add_child(newBrick)
				var stagger = randf_range(-30, 30)
				newBrick.position = Vector2(left_bound + (column_spacing * c), margin + (150 * r) + stagger)
	
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/arcade.tscn")
		
func _on_brick_timer_timeout() -> void:
	setupLevel()
