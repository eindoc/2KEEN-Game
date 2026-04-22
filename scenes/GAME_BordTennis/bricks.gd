extends RigidBody2D

#var spin_speed : float = 0.0

func _ready() -> void:
	#spin_speed = randf_range(-40.0, 40.0)
	$AnimatedSprite2D.play()
	$ZombiedeathAnimation.visible = false

func hit():
	$AnimatedSprite2D.visible = false
	$CollisionShape2D.disabled = true
	$AudioStreamPlayer2D.play()
	$ZombiedeathAnimation.visible = true
	$ZombiedeathAnimation.play()
	await $ZombiedeathAnimation.animation_finished
	$ZombiedeathAnimation.visible = false
	
	
	await get_tree().create_timer(1).timeout
	queue_free()
	
func _physics_process(delta: float) -> void:
	#rotation += spin_speed * delta
	if global_position.y > 720:
		print("brick off screen")
		queue_free()
