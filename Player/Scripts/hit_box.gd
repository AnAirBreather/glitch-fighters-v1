class_name HitBox
extends Area2D

func _ready():
	collision_layer = 2
	collision_mask = 0 #The hitbox has no collision mask
