extends StaticBody2D


func get_hit():
	PlonkoScore.score += 10
	print("Peg hit! Score: ", PlonkoScore.score)
	queue_free()
