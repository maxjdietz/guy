extends Node2D
var barChecker := 0


@onready var label: Label = %Label


func _process(delta: float) -> void:
	if barChecker == 1:
		if Input.is_action_pressed("enter"):
			print("TEST")
			barChecker = 0
			GlobalVariables.guy_overworld_position = Vector2(1050, -50)
			get_tree().change_scene_to_file("res://bar.tscn")
		
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	%VBoxContainer.visible = true
	barChecker = 1
	
	
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	%VBoxContainer.visible = false
	print("TESTTESTSTES")
	barChecker = 0
