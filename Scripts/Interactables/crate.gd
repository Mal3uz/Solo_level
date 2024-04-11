extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hitbox_area_entered(area):
	if area.name == "range":
		player_data.current_health -=1
		$anim.play("Destroyed")
		await  $anim.animation_finished
		queue_free()
