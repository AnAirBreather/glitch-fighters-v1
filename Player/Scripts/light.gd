class_name PlayerLightState
extends PlayerState

var has_attacked: bool #A variable to check if the player has attacked

@onready var hitbox: Area2D = $HitBox

func enter() -> void:
	has_attacked = false
	if sprite_flipped: hitbox.scale.x = -1
	else: hitbox.scale.x = 1
	player.animation.play(light_anim, -1, 1.5)
	player.animation.animation_finished.connect(func(_anim): has_attacked = true)

func process_input(_event: InputEvent) -> State:
	super(_event)
	has_attacked = true
	if has_attacked and _event.is_action_pressed(movement_key):
		determine_sprite_flipped(_event.as_text())
		return walk_state
	elif has_attacked and _event.is_action_pressed(jump_key): return jump_state
	return null

func process_frame(_delta: float) -> State:
	super(_delta)
	if has_attacked: return idle_state
	return null
