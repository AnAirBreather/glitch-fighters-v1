extends Control

func _ready(): #When the function is ready
	pass #Go to the next instruction

func _on_start_button_pressed() -> void: #When the start button is pressed
	get_tree().change_scene_to_file("res://Menus/characterMenu.tscn")


func _on_options_button_pressed() -> void: #When the options button is pressed
	get_tree().change_scene_to_file("res://Menus/optionsMenu.tscn")


func _on_quit_button_pressed() -> void: #When the quit button is pressed
	get_tree().quit() #Exit the game


func _on_credits_button_pressed() -> void: #When the credits button is pressed
	get_tree().change_scene_to_file("res://Menus/creditsMenu.tscn") #Changes the current scene
