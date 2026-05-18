extends RigidBody2D

var animations = ["zombiewalk1", "zombiewalk2", "zombiewalk3", "zombiewalk4", "zombiewalk5", "zombiewalk6"]

#@onready var main_score = %Main
var main_score = null

func _ready() -> void:
	main_score = get_tree().root.get_node("BordTennis/Main")
	gravity_scale = randf_range(0.005, 0.02)
	var random_anim = animations[randi() % animations.size()]
	$ZombieWalkAnimation.play(random_anim)
	$ZombieDeathAnimation.visible = false
	body_entered.connect(_on_body_entered)
	print("zombie ready, signal connected: ", body_entered.is_connected(_on_body_entered))

var is_dead = false

func hit():
	if is_dead:
		return
	linear_velocity = Vector2.ZERO
	#freeze = true
	$ZombieWalkAnimation.visible = false
	await get_tree().process_frame
	$CollisionShape2D.disabled = true
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.9, 1.2)
	$AudioStreamPlayer2D.play()

	$ZombieDeathAnimation.visible = true
	$ZombieDeathAnimation.play()
	await $ZombieDeathAnimation.animation_finished
	$ZombieDeathAnimation.visible = false
	
	
	await get_tree().create_timer(1).timeout
	queue_free()
	
func _physics_process(delta: float) -> void:
	#for body in $Area2D.get_overlapping_bodies():
		#if body.is_in_group("player"):
			#print("player overlapping")
			#hit()
			#break
	
	#rotation += spin_speed * delta
	if global_position.y > 980:
		print("brick off screen")
		queue_free()

			
func _on_body_entered(body):
	print("body entered: ", body.name)
	if body.name == "Player":
		#freeze = true
		
		print("main_score ref: ", main_score)
		#if main_score:
			#main_score.add_point()
			#main_score.add_point()
			#main_score.add_point()
			
		print("main_score ref: ", main_score)
		print("add point")
		print("has slowdown method: ", body.has_method("slowdown"))
		body.slowdown()
		hit()
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Area2D hit by: ", body.name)
	if body.is_in_group("player"):
		if main_score:
			main_score.add_point()
			main_score.add_point()
			main_score.add_point()
		body.slowdown()
		hit()
		print("hit")
		print("main_score ref: ", main_score)
