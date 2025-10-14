extends Control

var sprintChecker

func _ready() -> void:
	GlobalVariables.stamina.connect(_on_guy_sprinting)

func createTimer(seconds):
	await get_tree().create_timer(seconds)
	


func _on_guy_sprinting(runChecker: bool) -> void:
	#print("SPRINT FUNC")
	if runChecker == true:
		sprintChecker = true
		%StaminaBar.value -= 1
		if %StaminaBar.value == 0:
			sprintChecker = false
			GlobalVariables.staminaStop.emit()
		else:
			createTimer(0.1)
		
	elif runChecker == false:
		
		sprintChecker = false
		
		%StaminaBar.value += 1
		createTimer(0.1)
		
	 	


func _on_timer_timeout() -> void:
	print("TIMER")
	if sprintChecker == true:
		_on_guy_sprinting(true)
	elif sprintChecker == false:
		print("NOT SPRINTING")
		_on_guy_sprinting(false)
		
		
		
