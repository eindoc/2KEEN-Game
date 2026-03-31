extends Area2D


func _ready():
	pass



func _on_body_entered(body: Node2D) -> void:
	if body_entered:
		visible = false
		



func _on_body_exited(body: Node2D) -> void:
	visible = true
