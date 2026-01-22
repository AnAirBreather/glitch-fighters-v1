extends Control

func _ready():
	pass

func _on_back_button_pressed() -> void: #When the back button is pressed
	get_tree().change_scene_to_file("res://Menus/Menu.tscn") #Go to the main menu scene
