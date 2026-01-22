class_name PlayerWalkState
extends PlayerState

const SPEED: float = 90

func enter() -> void:
	super()
	player.animation.play(walk_anim, -1, 2)

func exit(_new_state: State = null) -> void:
	super(_new_state)
	player.velocity.x = 0.0

func process_input(_event: InputEvent) -> State:
	super(_event)
	if _event.is_action_pressed(movement_key): determine_sprite_flipped(_event.as_text())
	elif _event.is_action_pressed(jump_key) and player.is_on_floor(): return jump_state
	elif _event.is_action_pressed(light_key): return light_state
	elif _event.is_action_pressed(heavy_key): return heavy_state
	return null

func process_physics(_delta: float) -> State:
	super(_delta)
	do_move(get_move_dir())
	if get_move_dir() == 0.0: return idle_state
	return null

func get_move_dir() -> float: #Gets the current directional input
	return Input.get_axis(left_key, right_key)

func do_move(move_dir: float) -> void: #Moves the player along a vertical direction
	#Flip Sprite
	player.velocity.x = move_dir * SPEED
