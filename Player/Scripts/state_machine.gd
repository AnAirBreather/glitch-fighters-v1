class_name StateMachine
extends Node2D

var current_state: State #Defines the current state

@export var starting_state: State #Defines the starting state of the character

func init() -> void: change_state(starting_state) #Initialises the player into the starting state

func process_frame(_delta: float) -> void: #Allows code to update nodes every frame
	var _new_state: State = current_state.process_frame(_delta)
	if _new_state: change_state(_new_state)

func process_input(_event: InputEvent) -> void: #Allows inputs to be processed
	var _new_state: State = current_state.process_input(_event)
	if _new_state: change_state(_new_state)

func process_physics(_delta: float) -> void: #Keeps the game's physics running independent of the frameratee
	var _new_state: State = current_state.process_physics(_delta)
	if _new_state: change_state(_new_state)

func change_state(_new_state: State) -> void:
	if current_state: current_state.exit(_new_state)
	current_state = _new_state
	current_state.enter()
