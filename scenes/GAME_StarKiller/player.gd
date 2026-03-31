extends CharacterBody2D

const SPEED = 600.0

@onready var BULLET = preload("res://scenes/GAME_StarKiller/bullets.gd")

#@export var BULLET : PackedScene

func _ready():
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump"):
		shoot()
		#var bullet = BULLET.instance
		#get_node("/root/Main").add_child(bullet)
		#bullet.global_position = $Position2D.global_position
		
func shoot():
	var b = BULLET.instantiate()
	add_child(b)
	
	
func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.y, 0, SPEED)
		
	velocity.y = 0
	move_and_slide()
	
	
