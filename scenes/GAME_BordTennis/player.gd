extends CharacterBody2D

@export var speed = 0

var min_x : float
var max_x : float

func _ready():
	#var left_wall: Node2D = get_tree().get_first_node_in_group("left_wall")
	#var right_wall: Node2D = get_tree().get_first_node_in_group("right_wall")
	$Paddlebounce.play("moving")
	

func _physics_process(_delta: float) -> void:
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.y, 0, speed)
		
		
	velocity.y = 0
	move_and_slide()
	position.y = -1512.503
	
	
