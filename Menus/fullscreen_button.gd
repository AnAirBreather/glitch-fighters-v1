extends CheckButton




func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true: #If the switch is pressed
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) #Change to fullscreen modee
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) #Change to windowed mode
