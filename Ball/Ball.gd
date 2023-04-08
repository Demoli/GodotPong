class_name Ball
extends CharacterBody2D

@export var speed = -500

@export var serve_angle_range = 0

@export var min_deflect_angle := 15
@export var max_deflect_angle := 50

func _physics_process(delta):
	if Input.is_action_just_released("serve"):
		velocity = Vector2(speed, 0) 
	
	var c = move_and_collide(velocity * delta)
	if c:
		velocity = velocity.bounce(c.get_normal())
		
		if c.get_collider() is Paddle:
			var deflect := 0.0
			var col_position = (c.get_collider().global_position.y - global_position.y)
			var segment_size = ceil(c.get_collider().get_node("Sprite2D").get_rect().size.y / 3)
			
			if col_position >= segment_size:  # top
				deflect = randf_range(-min_deflect_angle, -max_deflect_angle)
			elif col_position <= -segment_size: # bottom
				deflect = randf_range(min_deflect_angle, max_deflect_angle)

			velocity = velocity.rotated(deg_to_rad(deflect))
