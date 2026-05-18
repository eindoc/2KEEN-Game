extends CharacterBody2D

var animations = ["zombiewalk1", "zombiewalk2", "zombiewalk3", "zombiewalk4", "zombiewalk5", "zombiewalk6"]
var main_score = null
var is_dead = false
var walk_speed: float

func _ready() -> void:
	main_score = get_tree().root.get_node("BordTennis/Main")
	walk_speed = randf_range(5, 60)  # pixels per second — tweak to taste
	var random_anim = animations[randi() % animations.size()]
	$ZombieWalkAnimation.play(random_anim)
	$ZombieDeathAnimation.visible = false

func _physics_process(delta: float) -> void:
	if is_dead:
		return

	if global_position.y > 980:
		print("zombie off screen")
		queue_free()
		return

	velocity = Vector2(0, walk_speed)
	move_and_slide()

	# Check for player collision via move_and_slide's built-in result
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider and collider.name == "Player":
			collider.slowdown()
			hit()
			break

func hit():
	if is_dead:
		return
	is_dead = true
	velocity = Vector2.ZERO
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

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Area2D hit by: ", body.name)
	if body.is_in_group("player"):
		if main_score:
			main_score.add_point()
		body.slowdown()
		hit()
