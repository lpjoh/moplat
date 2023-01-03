extends Node2D

var speed = 75

func _process(delta):
	speed += 2 * delta
