extends StaticBody2D



func get_hit():
	PlonkoScore.score += 10
	$ColorRect.visible = false #hide peg visual first
	$CollisionShape2D.set_deferred("disabled", true) #no mo hit
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.8, 1.2)
	$AudioStreamPlayer2D.play()
	print("explosion playing")
	$spark.visible = true
	$spark.play("blow")
	print("current animation: ", $spark.animation)
	print("is playing: ", $spark.is_playing())
	await $spark.animation_finished
	print("Peg hit! Score: ", PlonkoScore.score)
	queue_free()
