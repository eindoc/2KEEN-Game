extends Area2D

var SPEED = 750



func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	position.y -= 5
