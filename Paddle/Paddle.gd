class_name Paddle
extends CharacterBody2D

@export var speed = 300

func _physics_process(delta):
	
	var c = move_and_collide(velocity * delta)

	if c:
		pass
