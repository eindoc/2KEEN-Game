extends Node2D

@export var layouts: Array[PackedScene]
var current_layout: int = 0
@export var ball_scene: PackedScene
var balls_remaining: int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_ball()
	load_layout(0)
	
func load_layout(index: int):
	for child in get_children():
		if child.is_in_group("layout"):
			child.queue_free()
	var layout = layouts[index].instantiate()
	layout.add_to_group("layout")
	add_child(layout)
	
func load_random():
	load_layout(randi() % layouts.size())
	
func next_layout():
	current_layout = (current_layout + 1) % layouts.size()
	load_layout(current_layout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_ball():
	if balls_remaining <= 0:
		return
	var ball = ball_scene.instantiate()
	ball.position = $BallSpawnPoint.position
	add_child(ball)
	balls_remaining -= 1
	
	
