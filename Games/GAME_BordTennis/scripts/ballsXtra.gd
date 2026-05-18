#extends CharacterBody2D
#
#@onready var main_score = %Main
#
#
#var win_size : Vector2
#var START_SPEED : int = 200
#var dir : Vector2
#var is_active = true
#var onscreen = false
#
#func _ready():
	#randomize()
	#win_size = get_viewport_rect().size
	#velocity = random_direction() * START_SPEED
	#
#func _physics_process(delta: float) -> void:
	#if not is_active:
		#print("not active bro####")
	#if is_active:		
		#var collision = move_and_collide(velocity * delta)
		#
		#if collision:
			#
			#var collider = collision.get_collider()	
			#
			#if collision.get_collider().has_method("hit"):
				#collision.get_collider().hit()
				#main_score.add_point()
			#
			#
			#if collider.name == "Player":
				#$BallHit.play()
				#
				#var paddle_velocity = collider.velocity.x
				#var influence = 0.75
				#main_score.add_point()
				#velocity.x += paddle_velocity * influence
				#velocity = velocity.normalized() * START_SPEED
			#velocity = velocity.bounce(collision.get_normal())
		#if(velocity.x > 0 and velocity.x < 100):
			#velocity.x = -200
			#
#func _on_screencheck_screen_entered() -> void:
	#onscreen = true
	#
#func new_ball():
	#if not onscreen:
		#print("butts")
		#var paddle = get_parent().get_node("Player") # the paddle node
		#var paddle_rect = paddle.get_node("ColorRect") # the visual 
		#var paddle_top = paddle.position.x - (paddle_rect.size.x / 2)
		#var ball_y = paddle_top - 200
		#var ball_x = paddle.position.x
#
		#position = Vector2(ball_x, ball_y)
		#velocity = random_direction() * START_SPEED
	#
#func random_direction():
	#var x = randf_range(-0.8, 0.8)
	#var y = -1.0
	#return Vector2(x, y).normalized()
	#
#func increase_speed_by(amount: float):
	#START_SPEED += amount
	#velocity = velocity.normalized() * START_SPEED
#
#
#func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#print("dimsungparadise")	
	#onscreen = false
