extends CharacterBody2D

@onready var anim_tree = $anim_tree
@onready var anim_state = anim_tree.get("parameters/playback")

enum player_states {MOVE, ATTACK, DEATH}
var current_states = player_states.MOVE

var input_movement = Vector2.ZERO
var speed = 70

func _ready():
	$range/CollisionShape2D.disabled = true

func _physics_process(delta):
	match  current_states:
		player_states.MOVE:
			move()
		player_states.ATTACK:
			attack()

func  move():
	input_movement = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if input_movement != Vector2.ZERO:
		anim_tree.set("parameters/Idle/blend_position",input_movement)
		anim_tree.set("parameters/Attack/blend_position",input_movement)
		anim_tree.set("parameters/Walk/blend_position",input_movement)
		anim_tree.set("parameters/Death/blend_position",input_movement)
		anim_state.travel("Walk")
		velocity = input_movement * speed
	
	if  input_movement == Vector2.ZERO:
		anim_state.travel("Idle")
		velocity = Vector2.ZERO
		
	
	if Input.is_action_just_pressed("attack"):
		current_states = player_states.ATTACK
		
	move_and_slide()

func attack():
	anim_state.travel("Attack")
	
func on_states_reset():
	current_states = player_states.MOVE
