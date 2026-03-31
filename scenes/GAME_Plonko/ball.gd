extends RigidBody2D

var velocity = Vector2(200, 200)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 4
	#linear_velocity = Vector2(randf_range(-50, 50), 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
		
		
		
		
#func _on_body_entered(body: Node) -> void:
	#if body.is_in_group("pegs"):
		#body.hit()
