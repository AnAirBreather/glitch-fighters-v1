extends CheckButton

func _ready() -> void:
	if (DisplayServer.window_get_mode() == 3): #Checks if the window is fullscreen
		button_pressed = true #The switch is toggled on

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true: #If the switch is pressed
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) #Change to fullscreen mode
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) #Change to windowed mode
