class_name State
extends Node2D

func enter() -> void:
	pass

func exit(_new_state: State = null) -> void:
	pass

func process_frame(_delta: float) -> State: #Allows code to update nodes every frame
	return null

func process_input(_event: InputEvent) -> State: #Allows inputs to be processed
	return null

func process_physics(_delta: float) -> State: #Keeps the game's physics running independent of the frameratee
	return null
