extends CharacterBody2D


var SPEED = 300.0
var sprint_animation = false

const JUMP_VELOCITY = -400.0

signal sprinting(value1: bool)

func _ready() -> void:
	GlobalVariables.staminaStop.connect(stop_sprint)

func play_walk():
	%AnimatedSprite2D.play("walk")
		
func play_run():
	%AnimatedSprite2D.play("run")

func play_idle():
	%AnimatedSprite2D.play("idle")
	

func stop_sprint():
	SPEED = 300
	play_walk()
	sprint_animation = false
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	
	if Input.is_action_pressed("sprint"):
		SPEED = 600 
		GlobalVariables.stamina.emit(true)
		sprint_animation = true
		
	else:
		SPEED = 300
		GlobalVariables.stamina.emit(false)
		sprint_animation = false
		
		
	var direction = Input.get_vector("move_left", "move_right", 
	"move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	if velocity.length() > 0 && sprint_animation == false:
		play_walk()
	elif velocity.length() > 0 && sprint_animation == true:
		play_run()
	else:
		play_idle()
		

	# Handle jump.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.


	move_and_slide()
