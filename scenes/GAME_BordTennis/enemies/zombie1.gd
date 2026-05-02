extends RigidBody2D

#@onready var main_score = %Main

#var spin_speed : float = 0.0

func _ready() -> void:
	#print_tree_pretty()
	#spin_speed = randf_range(-40.0, 40.0)
	$AnimatedSprite2D.play()
	$ZombiedeathAnimation.visible = false
	body_entered.connect(_on_body_entered)
	print("zombie ready, signal connected: ", body_entered.is_connected(_on_body_entered))

func hit():
	print("fasdfasdfasdf")
	$AnimatedSprite2D.visible = false
	await get_tree().process_frame
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
	if global_position.y > 980:
		print("brick off screen")
		queue_free()
		
#func _on_body_entered(body):
		#if body.name == "Player":
			#freeze = true
			#print("hit player: ", body.name)
			#print("player has slowdown: ", body.has_method("slowdown"))
			#body.slowdown()
			#hit()
			
func _on_body_entered(body):
	print("body entered: ", body.name)
	if body.name == "Player":
		freeze = true
		var main_score = get_tree().root.get_node("BordTennis/Main")
		
		print("main_score ref: ", main_score)
		if main_score:
			main_score.add_point()
			main_score.add_point()
			main_score.add_point()
			
		print("main_score ref: ", main_score)
		print("add point")
		print("has slowdown method: ", body.has_method("slowdown"))
		body.slowdown()
		hit()
		
