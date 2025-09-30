extends CharacterBody2D


const SPEED = 300.0


const JUMP_VELOCITY = -400.0


func play_walk():
		%AnimatedSprite2D.play("walk")

func play_idle():
		%AnimatedSprite2D.play("idle")
	


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	
	
		
	var direction = Input.get_vector("move_left", "move_right", 
	"move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	if velocity.length() > 0:
		play_walk()
	else:
		play_idle()
		

	# Handle jump.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.


	move_and_slide()
