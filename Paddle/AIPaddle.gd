extends Paddle

@onready var ball = get_node("../Ball")

func _physics_process(delta):
	var direction = position.direction_to(ball.position).y
	
	velocity = Vector2(0, direction * speed)
	
	move_and_collide(velocity)
