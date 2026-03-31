extends CharacterBody2D

@export var speed = 1000

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta: float) -> void:
	
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
