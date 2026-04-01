extends Node2D

@export var peg_scene: PackedScene
@export var layout_path: String = "res://scenes/GAME_Plonko/levels/layout_01.json"

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
