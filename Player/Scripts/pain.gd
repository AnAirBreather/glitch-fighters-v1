class_name PlayerPainState
extends PlayerState

@onready var hurt_box: Area2D = $HurtBox

var has_pained: bool

func enter() -> void:
	has_pained = false
	player.animation.play(pain_anim)
	player.animation.animation_finished.connect(func(_anim): has_pained = true)

func exit(_new_state: State = null) -> void:
	super(_new_state)
	player.velocity.x = 0.0

func process_input(_event: InputEvent) -> State:
	super(_event)
	has_pained = true
	if has_pained and _event.is_action_pressed(movement_key):
		determine_sprite_flipped(_event.as_text())
		return walk_state
	elif has_pained and _event.is_action_pressed(jump_key): return jump_state
	return null

func process_frame(_delta: float) -> State:
	super(_delta)
	if has_pained: return idle_state
	return null

func process_physics(_delta: float) -> State:
	super(_delta)
	push_back()
	return null

func push_back() -> void:
	var push_dir: Vector2 = hurt_box.hitting_area.global_position - player.global_position
	player.velocity.x += push_dir.x * 500
