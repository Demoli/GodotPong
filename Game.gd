class_name Game
extends Node2D

enum Players{P1,CPU1}

@onready var ball = preload("res://Ball/Ball.tscn")

@export var score_limit = 5

@onready var players = {
	Players.P1: get_node("PlayerPaddle"),
	Players.CPU1: get_node("AIPaddle"),
}

var player_names = {
	Players.P1: "Player 1",
	Players.CPU1: "CPU 1",
}

var scores = {
	Players.P1:0,
	Players.CPU1:0,
}

func _ready():
	reset_ball(Players.CPU1)

func _on_goal_ball_entered(goal: Goal):
	scores[goal.player_index] += 1
	
	var ball = $Ball
	ball.name = "deadBall"
	ball.queue_free()
	
	call_deferred("reset_ball", goal.player_index)
	call_deferred("check_win")

func reset_ball(player_index):
	var new = ball.instantiate()
	var serving = players[player_index] as Paddle
	new.serving_player = serving
	new.position = serving.position + serving.serve_offset
	add_child(new)
	
	if player_index == Players.CPU1:
		serving.serve()

func check_win():
	for i in scores.keys():
		var s = scores[i]
		if s >= score_limit:
			game_over(i)
			
func game_over(winner_index):
	print("%s Wins!" % player_names[winner_index])
	get_tree().reload_current_scene()
		
