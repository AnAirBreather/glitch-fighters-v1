extends CheckButton

func _ready() -> void:
	if (DisplayServer.window_get_mode() == 3):
		button_pressed = true

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true: #If the switch is pressed
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN) #Change to fullscreen mode
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) #Change to windowed mode
