extends Control





func _on_button_pressed() -> void:
	print("test")
	get_tree().change_scene_to_file("res://OverworldStuff/overworld.tscn")
