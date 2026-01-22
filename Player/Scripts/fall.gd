class_name PlayerFallState
extends PlayerState

const AIR_SPEED: float = 60
const JUMP_FORCE: float = 20

func enter() -> void:
	super()
	player.animation.play(fall_anim, -1, 2)

func exit(_new_state: State = null) -> void:
	super(_new_state)
	player.velocity.x = 0.0

func process_input(_event: InputEvent) -> State:
	super(_event)
	if _event.is_action_pressed(movement_key): determine_sprite_flipped(_event.as_text())
	return null

func process_physics(_delta: float) -> State:
	do_move(get_move_dir())
	if(player.is_on_floor()):
		if get_move_dir() != 0.0: return walk_state #Return to walk state if the player is moving
		else: return idle_state #If the player isn't moving, return to the idle state
	player.velocity.y += gravity * _delta
	player.move_and_slide()
	return null

func get_move_dir() -> float: return Input.get_axis(left_key, right_key) #Gets the current directional input 

func do_move(move_dir: float) -> void: player.velocity.x = move_dir * AIR_SPEED #Moves the player along a vertical direction
