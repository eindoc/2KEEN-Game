extends RigidBody2D

@export var ball_scene: PackedScene
@export var max_balls: int = 3
var balls_remaining: int = 3

var canLaunch = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 10
	#position = Vector2(1290, 75)
	canLaunch = true
	#spawn_ball()
	#linear_velocity = Vector2(randf_range(-50, 50), 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump") && canLaunch:
		linear_velocity = Vector2(0, -2000)
		canLaunch = false
		

func _on_body_entered(body):
	print("hit: ", body.name)
	if body.has_method("get_hit"):
		body.get_hit()
		$AudioStreamPlayer2D.pitch_scale = randf_range(0.8, 1.2)
		$AudioStreamPlayer2D.play()

#func spawn_ball():
	#if balls_remaining <= 0:
		#return
	#var ball = ball_scene.instantiate()
	#ball.position = $BallSpawnPoint.position
	#add_child(ball)
	#balls_remaining -= 1
