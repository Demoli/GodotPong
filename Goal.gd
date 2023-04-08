class_name Goal
extends Area2D

signal ball_entered

@export var player_index : Game.Players

func _on_body_entered(body):
	if body is Ball:
		emit_signal("ball_entered", self)
