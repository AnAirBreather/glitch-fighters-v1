class_name PlayerIdleState
extends PlayerState

func enter() -> void:
	player.animation.play(idle_anim, -1, 2)

func exit(_new_state: State = null) -> void:
	super(_new_state)

func process_input(_event: InputEvent) -> State:
	super(_event)
	if _event.is_action_pressed(movement_key):
		determine_sprite_flipped(_event.as_text())
		return walk_state
	elif _event.is_action_pressed(jump_key) and player.is_on_floor(): return jump_state
	elif _event.is_action_pressed(light_key): return light_state
	elif _event.is_action_pressed(heavy_key): return heavy_state
	return null
