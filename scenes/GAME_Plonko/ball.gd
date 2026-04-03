extends RigidBody2D

var velocity = Vector2(200, 200)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 10
	#linear_velocity = Vector2(randf_range(-50, 50), 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass


func _on_body_entered(body):
	print("hit: ", body.name)
	if body.has_method("get_hit"):
		body.get_hit()

func _input(event):
	if event is InputEventKey and event.keycode == KEY_SPACE and event.pressed:
		linear_velocity = Vector2(-1000, 50)