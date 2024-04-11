extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		if player_data.current_health < player_data.max_health:
			player_data.current_health += 1
		print(player_data.current_health)
		queue_free()
		
