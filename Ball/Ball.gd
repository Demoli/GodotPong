class_name Ball
extends CharacterBody2D

@export var speed = -500

@export var serve_angle_range = 0

@export var max_deflect_angle := 45

func _physics_process(delta):
	if Input.is_action_just_released("serve"):
		velocity = Vector2(speed, 0) 
	
	var c = move_and_collide(velocity * delta)
	if c:
		var col_position = (c.get_collider().global_position.y - global_position.y)
		
		velocity = velocity.bounce(c.get_normal())
		
		if c.get_collider() is Paddle:
			var deflect := 0.0

			if col_position >= 10:  # top
				deflect = randf_range(5, -max_deflect_angle)
			elif col_position <= -10: # bottom
				deflect = randf_range(5, max_deflect_angle)

			velocity = velocity.rotated(deg_to_rad(deflect))
