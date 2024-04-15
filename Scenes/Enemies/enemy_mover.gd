extends CharacterBody2D
class_name enemy_movement



enum enemy_states {MOVELEFT, MOVERIGHT, DEAD}
var current_states 

@onready var dead_anim = preload("res://Scenes/Effects/dead_fx.tscn")
@onready var heart_loot = preload("res://Scenes/Interactables/heart.tscn")
@export var speed = 10
@export var health = 3

var dir


func _physics_process(delta):
	if health <= 0:
		current_states = enemy_states.DEAD
	
	match  current_states:
		enemy_states.MOVELEFT:
			move_left()
		enemy_states.MOVERIGHT:
			move_right()
		enemy_states.DEAD:
			dead()
	
	move_and_slide()

func random_generation():
	dir = randi() % 2
	print(dir)
	random_direction()

func random_direction():
	match dir:
		0:
			current_states = enemy_states.MOVERIGHT
		1:
			current_states = enemy_states.MOVELEFT

func move_right():
	velocity = Vector2.RIGHT * speed
	$anim.play("move_right")

func move_left():
	velocity = Vector2.LEFT * speed
	$anim.play("move_left")

func dead():
	dead_animation()
	queue_free()
	
func dead_animation():
	var dead = dead_anim.instantiate()
	dead.global_position = global_position
	get_tree().get_root().add_child(dead)
	loot_heart()

func loot_heart():
	var heart = heart_loot.instantiate()
	heart.global_position = global_position
	get_tree().get_root().add_child(heart)
