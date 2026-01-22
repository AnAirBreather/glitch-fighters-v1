class_name PlayerJumpState
extends PlayerState

const AIR_SPEED: float = 75
const JUMP_FORCE: float = -300

func enter() -> void:
	super()
	player.velocity.y = JUMP_FORCE
	player.animation.play(jump_anim, -1, 2)

func exit(_new_state: State = null) -> void:
	super(_new_state)
	player.velocity.x = 0.0

func process_input(_event: InputEvent) -> State:
	super(_event)
	if _event.is_action_pressed(movement_key): determine_sprite_flipped(_event.as_text())
	if _event.is_action_released(jump_key): return fall_state
	return null

func process_physics(_delta: float) -> State:
	do_move(get_move_dir())
	super(_delta)
	return null

func get_move_dir() -> float: #Gets the current directional input
	return Input.get_axis(left_key, right_key)

func do_move(move_dir: float) -> void: #Moves the player along a vertical direction
	player.velocity.x = move_dir * AIR_SPEED
	
