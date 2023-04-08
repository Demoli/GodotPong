extends Control

@onready var game = get_node("../../")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%PlayerScore.text = str(game.scores[Game.Players.P1])
	%AIScore.text = str(game.scores[Game.Players.CPU1])
