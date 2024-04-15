extends enemy_movement


func _ready():
	random_generation()


func _on_timer_timeout():
	random_generation()
	$Timer.start()





func _on_hitbox_area_entered(area):
	if area.is_in_group("Range"):
		health -= 1
		print(health)
