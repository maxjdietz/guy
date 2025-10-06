extends Area2D


var leaveBarChecker := 0

func _ready() -> void:
	leaveBarChecker = 0

func _process(delta: float) -> void:
	if leaveBarChecker == 1:
		if Input.is_action_pressed("enter"):
			print("TEST2")
			leaveBarChecker = 0
			get_tree().change_scene_to_file("res://OverworldStuff/overworld.tscn")




func _on_body_entered(body: Node2D) -> void:
	%barLeaveLabel.visible = true
	leaveBarChecker = 1


func _on_body_exited(body: Node2D) -> void:
	%barLeaveLabel.visible = false
	leaveBarChecker = 0
