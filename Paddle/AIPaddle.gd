extends Paddle

func _ready():
	player_index = Game.Players.P1

func _physics_process(delta):
	var ball = get_node("../Ball")
	if not ball:
		return
		
	var direction = position.direction_to(ball.position).y
	
	if direction:
		velocity = Vector2(0, direction * speed)
	else:
		velocity = Vector2()
		
	super(delta)
	
