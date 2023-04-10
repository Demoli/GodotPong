class_name Ball
extends CharacterBody2D

@export var speed = -500
@export var serve_angle_range = 0
@export var min_deflect_angle := 20
@export var max_deflect_angle := 60

func _physics_process(delta):
	if velocity == Vector2() and Input.is_action_just_released("serve"):
		serve()
	
	var c = move_and_collide(velocity * delta)
	if c:
		velocity = velocity.bounce(c.get_normal())
		if c.get_collider() is Paddle:
			var deflect := 0.0
			var shape_name = c.get_collider_shape().name
			
			if shape_name == "Top":
				deflect = randf_range(-min_deflect_angle, -max_deflect_angle)
			elif shape_name == "Bottom":
				deflect = randf_range(min_deflect_angle, max_deflect_angle)
			elif shape_name == "Middle":
				pass
				
			velocity = velocity.rotated(deg_to_rad(deflect))

func serve():
	var p = get_node("../PlayerPaddle")
	velocity = Vector2(speed, 0) 
	
