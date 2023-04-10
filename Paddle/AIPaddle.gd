extends Paddle

var serving = false

var serve_point: Vector2

var direction: Vector2

func _ready():
	player_index = Game.Players.P1
	serve_offset = Vector2(-10,0)


func _physics_process(delta):
	var ball = get_node("../Ball")
	if not ball:
		return
		
	if serving:
		direction = position.direction_to(serve_point)
		if position.distance_to(serve_point) <= 5:
			direction = Vector2()
			if $ServeTimer.is_stopped():
				$ServeTimer.start()
	else:		
		direction = position.direction_to(ball.position)
	
	if direction:
		velocity = Vector2(0, direction.y * speed)
	else:
		velocity = Vector2()
		
	super(delta)

func serve():
	serving = true
	var ball = get_node("../Ball") as Ball
	
	serve_point = position + Vector2(0, randi_range(-40, 40))
	
func _on_serve_timer_timeout():
	var ball = get_node("../Ball") as Ball
	ball.serve()
	serving = false
