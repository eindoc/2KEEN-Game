extends RigidBody2D

const START_SPEED : int = 500
const bounce = 1.0
const friction = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mat = PhysicsMaterial.new()
	mat.bounce = 1.0
	mat.friction = 0.0
	$CollisionShape2D.material = mat
	
	linear_velocity = Vector2(randf_range(-1, 1), [1, -1].pick_random()).normalized() * START_SPEED
	
	randomize()
	new_ball()
	
func new_ball():
	position = Vector2(640, 360)
	
	var dir = Vector2(randf_range(-1, 1), [1, -1].pick_random()).normalized()
	linear_velocity = dir * START_SPEED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
