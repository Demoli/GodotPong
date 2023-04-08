extends Paddle

@onready var ball = get_node("../Ball")

func _physics_process(delta):
	var direction = position.direction_to(ball.position).y
	
	if direction:
		velocity = Vector2(0, direction * speed)
	else:
		velocity = Vector2()
		
	super(delta)
	
