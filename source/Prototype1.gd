extends Node2D

var speed = 300.0
var max_speed = 800.0

func _physics_process(delta):
	speed += 20 * delta
	if speed >= max_speed:
		speed = min(speed, max_speed)
		set_physics_process(false)
