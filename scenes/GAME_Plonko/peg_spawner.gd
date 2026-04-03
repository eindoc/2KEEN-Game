extends Node2D

@export var peg_scene: PackedScene
@export var layout_path: String = "res://scenes/GAME_Plonko/levels/layout_01.json"

var layouts = [
    "res://scenes/GAME_Plonko/levels/layout_01.json",
    "res://scenes/GAME_Plonko/levels/layout_02.json",
    "res://scenes/GAME_Plonko/levels/layout_03.json"
]

func _ready():
	print("PegSpawner _ready called")
	
	if peg_scene == null:
		print("ERROR: peg_scene is not assigned")
		return
		
	var file = FileAccess.open(layout_path, FileAccess.READ)
	if file == null:
		print("ERROR: could not open file")
		return
	
	var pegs = JSON.parse_string(file.get_as_text())
	file.close()
	
	for peg_data in pegs:
		var peg = peg_scene.instantiate()
		add_child(peg)
		peg.position = Vector2(peg_data["x"], peg_data["y"])
		print("spawned peg at: ", peg.position)

func load_layout(path: String):
	for child in get_children():
		child.queue_free()
	var file = FileAccess.open(path, FileAccess.READ)
	var pegs = JSON.parse_string(file.get_as_text())
	file.close()
	for peg_data in pegs:
		var peg = peg_scene.instantiate()
		add_child(peg)
		peg.position = Vector2(peg_data["x"], peg_data["y"])

func load_random_layout():
	load_layout(layouts[randi() % layouts.size()])

func load_specific_layout(index: int):
	load_layout(layouts[index])