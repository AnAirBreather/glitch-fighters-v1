class_name Player
extends CharacterBody2D

@onready var state_machine: StateMachine = $"State Machine"
@onready var animation: AnimationPlayer = $Animation
@onready var sprite: AnimatedSprite2D = $Sprite

func _ready(): state_machine.init() #Initialises the state machine

func _process(_delta): state_machine.process_frame(_delta) #Runs one of the body functions using a processor input function

func _physics_process(_delta): state_machine.process_physics(_delta) #Runs one of the body functions using a processor input function

func _input(_event): state_machine.process_input(_event) #Runs one of the body functions using a processor input function
