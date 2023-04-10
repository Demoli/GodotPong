class_name Ball
extends CharacterBody2D

@export var speed = 500
@export var serve_angle_range = 0
@export var min_deflect_angle := 20
@export var max_deflect_angle := 60
@export var serving_player: Paddle

var direction = Vector2.LEFT
	
func _physics_process(delta):
	if serving_player:
		if Input.is_action_just_released("serve"):
			serve()
		return
	
	var c = move_and_collide(velocity * delta)
	if c:
		direction.y = direction.y * -1
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
				
			if direction == Vector2.RIGHT:
				deflect *= -1
				
			velocity = velocity.rotated(deg_to_rad(deflect))

func serve():
	direction = Vector2.LEFT if serving_player.serve_offset.x > 0 else Vector2.RIGHT

	velocity = Vector2(speed, 0) * direction
	serving_player = null
	
