extends RigidBody2D

func _ready() -> void:
	$AnimatedSprite2D.play()

func hit():
	$AnimatedSprite2D.visible = false
	$CollisionShape2D.disabled = true
	$AudioStreamPlayer2D.play()
	
	
	await get_tree().create_timer(1).timeout
	queue_free()
