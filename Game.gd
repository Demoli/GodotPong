class_name Game
extends Node2D

enum Players{P1,CPU1}

@onready var ball = preload("res://Ball/Ball.tscn")

@export var score_limit = 5

var player_names = {
	Players.P1: "Player 1",
	Players.CPU1: "CPU 1",
}

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
	call_deferred("check_win")

func reset_ball():
	var new = ball.instantiate()
	new.position = Vector2(400, 250)
	add_child(new)

func check_win():
	for i in scores.keys():
		var s = scores[i]
		if s >= score_limit:
			game_over(i)
			
func game_over(winner_index):
	print("%s Wins!" % player_names[winner_index])
	get_tree().reload_current_scene()
		
