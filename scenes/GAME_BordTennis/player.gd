extends CharacterBody2D

var speed = 1000
var base_speed = 0
var is_slowed = false

var min_x : float
var max_x : float

func _ready():
	base_speed = speed
	#var left_wall: Node2D = get_tree().get_first_node_in_group("left_wall")
	#var right_wall: Node2D = get_tree().get_first_node_in_group("right_wall")
	$Paddlebounce.play("moving")
	
func slowdown():
	print("slowdown called, is_slowed: ", is_slowed)

	if not is_slowed:
		is_slowed = true
		speed = base_speed * 0.4
		await get_tree().create_timer(2.0).timeout
		speed = base_speed
		is_slowed = false
	

func _physics_process(_delta: float) -> void:
	print("speed: ", speed)
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.y, 0, speed)
		
		
	velocity.y = 0
	move_and_slide()
	position.y = -1203.57
	
	
