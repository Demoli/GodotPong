class_name Game
extends Node2D

enum Players{P1,CPU1}

@onready var ball = preload("res://Ball/Ball.tscn")

var scores = {
	Players.P1:0,
	Players.CPU1:0,
}

func _on_goal_ball_entered(goal: Goal):
	scores[goal.player_index] += 1
	
	var ball = $Ball
	ball.name = "deadBall"
	ball.queue_free()
	
	call_deferred("reset_ball")
	

func reset_ball():
	var new = ball.instantiate()
	new.position = Vector2(400, 250)
	add_child(new)
