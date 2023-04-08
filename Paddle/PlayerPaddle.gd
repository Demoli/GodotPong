extends Paddle

func _ready():
	player_index = Game.Players.P1

func _physics_process(delta):
	
	var direction = Input.get_axis("paddle_up", "paddle_down")
	if direction:
		velocity.y = direction * speed
	else:
		velocity.y = 0

	super(delta)
