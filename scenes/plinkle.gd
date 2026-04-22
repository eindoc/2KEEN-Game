extends Area2D

@onready var anim_player = $AnimationPlayer
@onready var songplayer = $ArcadeMachine/AudioStreamPlayer2D
@onready var gametitle = $AnimatedSprite2D/plinkleTitle
@onready var bordtenniscloud = $AnimatedSprite2D

var player_inside = false

func _ready() -> void:
	gametitle.visible = false

func _on_body_entered(body: Node2D) -> void:
		player_inside = true
		anim_player.play("demovid")
		songplayer.play()
		bordtenniscloud.play()


func _on_animated_sprite_2d_animation_finished() -> void:
	if player_inside:
		gametitle.visible = true
		
		
func _on_body_exited(body: Node2D) -> void:
	anim_player.stop()
	player_inside = false
	songplayer.stop()
	gametitle.visible = false
	bordtenniscloud.stop()
	
	

func _physics_process(delta: float) -> void:
		if player_inside and Input.is_action_just_pressed("Up"):
			get_tree().change_scene_to_file("res://scenes/GAME_Plonko/plonko.tscn")
		
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/arcade.tscn")
