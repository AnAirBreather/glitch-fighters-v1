class_name PlayerState
extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player") #Reference to the first node in the code for the player

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity", -9.8)

#Animation names
var idle_anim: String = "Idle"
var walk_anim: String = "Walk"
var jump_anim: String = "Jump"
var fall_anim: String = "Fall"
var light_anim: String = "Light"
var heavy_anim: String = "Heavy"

#States
@export_group("States")
@export var idle_state: PlayerState
@export var walk_state: PlayerState
@export var jump_state: PlayerState
@export var fall_state: PlayerState
@export var light_state: PlayerState
@export var heavy_state: PlayerState

#State Variables
var sprite_flipped: bool = false #A check to see if the sprite is flipped or not

#Input Keys
var movement_key: String = "Movement"
var left_key: String = "Left"
var right_key: String = "Right"
var jump_key: String = "Jump"
var light_key: String = "Light"
var heavy_key: String = "Heavy"

#Input Action
var left_actions: Array = InputMap.action_get_events(left_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0)) #A variable to store action keys to particular input mappings
var right_actions: Array = InputMap.action_get_events(right_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
#Util Fn
func determine_sprite_flipped(_event_text: String) -> void: #A function to determine when and how the sprite should be flipped
	if left_actions.find(_event_text) != -1: sprite_flipped = true
	elif right_actions.find(_event_text) != -1: sprite_flipped = false
	player.sprite.flip_h = sprite_flipped
	pass

#Base Fn
func process_physics(_delta: float) -> State:
	if(player.velocity.y > 0): return fall_state
	player.velocity.y += gravity * _delta
	player.move_and_slide()
	return null

func exit(_new_state: State = null) -> void:
	super()
	_new_state.sprite_flipped = sprite_flipped
