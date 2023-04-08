class_name Paddle
extends CharacterBody2D

@export var speed = 400

@export var player_index : Game.Players

func _physics_process(delta):
	
	var c = move_and_collide(velocity * delta)

	if c:
		pass
