extends CharacterBody2D

@onready var main_score = %Main
@onready var player = preload("res://player.gd")

var win_size : Vector2
var START_SPEED = 100
var dir : Vector2
var is_active = true
var hit_cooldown = false

func _ready():
	randomize()
	new_ball()
	win_size = get_viewport_rect().size
	velocity = random_direction() * START_SPEED

func _physics_process(delta: float) -> void:
	if not is_active:
		pass
		#print("not active bro####")
	if is_active:
		#print(velocity.y)
		#print(START_SPEED)
		var collision = move_and_collide(velocity * delta)

		if collision:
			var collider = collision.get_collider()
			$AnimatedSprite2D.play("bounce")
			
			if collision.get_collider().has_method("hit"):
				collider.hit()
				main_score.add_point()
				START_SPEED += 100
				
				var diff = global_position - collider.global_position
				if abs(diff.x) > abs(diff.y):
					velocity.x = -velocity.x
				else:
					velocity.y = -velocity.y

			else:
				velocity = velocity.bounce(collision.get_normal())

			if collider.name == "Player" and velocity:
				#%Paddlebounce.play("bounce")
				var paddle_velocity = collider.velocity.x
				var influence = 0.5
				velocity.x += paddle_velocity * influence
				velocity = velocity.normalized() * START_SPEED
				if not hit_cooldown:
					$BallHit.play()
					hit_cooldown = true
					$HitCooldownTimer.start()

		if velocity.x > 0 and velocity.x < 100:
			velocity.x = -200
		if velocity.y > -250 && velocity.y < 250:
			velocity.y = velocity.y * 1.5


func new_ball():
	print("new ball spawned")
	var speed = START_SPEED
	var paddle = get_parent().get_node("Player")
	var paddle_rect = paddle.get_node("ColorRect")
	var paddle_top = paddle.position.x - (paddle_rect.size.x / 2)
	var ball_y = paddle_top - 150
	var ball_x = paddle.position.x
	position = Vector2(ball_x, ball_y)
	velocity = random_direction() * START_SPEED


func reset():
	is_active = false
	await get_tree().create_timer(1).timeout
	new_ball()
	is_active = true


func random_direction():
	var x = randf_range(-0.8, 0.8)
	var y = -1.0
	return Vector2(x, y).normalized()


func _on_deathzone_body_entered(body: Node2D) -> void:
	if not is_active:
		return
	is_active = false
	main_score.lose_life()   # tell main to handle lives; main calls reset() if lives remain


func increase_speed_by(amount: float):
	START_SPEED += amount
	velocity = velocity.normalized() * START_SPEED

func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("idle")

func _on_paddlebounce_animation_finished() -> void:
	%Paddlebounce.play("idle")

func _on_hit_cooldown_timer_timeout() -> void:
	hit_cooldown = false
