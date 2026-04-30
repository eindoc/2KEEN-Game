extends CharacterBody2D

var speed = 1000
var base_speed = 0
var is_slowed = false
var friction = 3000
var acceleration = 8000

var min_x : float
var max_x : float

func _ready():
	#print_tree_pretty()
	base_speed = speed
	#var left_wall: Node2D = get_tree().get_first_node_in_group("left_wall")
	#var right_wall: Node2D = get_tree().get_first_node_in_group("right_wall")
	$Paddlebounce.play("moving")
	
func slowdown():
	print("slowdown called, is_slowed: ", is_slowed)

	if not is_slowed:
		is_slowed = true
		speed = base_speed * 0.4
		$Paddlebounce.play("bloody")
		await get_tree().create_timer(2.0).timeout
		speed = base_speed
		$Paddlebounce.play("idle")
		is_slowed = false
	

func _physics_process(_delta: float) -> void:
	var direction = 0.0
	
	if BordTennisGlobal.demo_mode:
		var ball = get_node("/root/BordTennis/Main/Ball")
		if ball:
			if ball.global_position.x < global_position.x - 10:
				direction = -1.0
			elif ball.global_position.x > global_position.x + 10:
				direction = 1.0
	else:
		direction = Input.get_axis("Left", "Right")
		
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * _delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * _delta)
		
	velocity.y = 0
	move_and_slide()
	position.y = -1203.57
	
	##print("speed: ", speed)
	#direction = Input.get_axis("Left", "Right")
	#if direction:
		#velocity.x = move_toward(velocity.x, direction * speed, acceleration * _delta)
	#else:
		#velocity.x = move_toward(velocity.x, 0, friction * _delta)
	#
	#velocity.y = 0
	#move_and_slide()
	#position.y = -1203.57
	
	
